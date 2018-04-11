class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.includes(:author) # only instance variables are passed to the view we render
    # ^^ only the controller should interact with the tweet model

    render :index
  end

  def show
    tweet = Tweet.find(params[:id])

    render json: tweet
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new # dummy tweet, no data
    render :new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to tweets_url
      # ^^ make another request
    else
      flash.now[:errors] = @tweet.errors.full_messages
      render :new
      # ^^ just show the view, no request - preserve @tweet which is currently being worked on
    end
  end


  def edit
    # use find, not find_by(id: ) -> raises an error, which is a good thing
    # in production that will turn into a 404 page
    @tweet = Tweet.find(params[:id])
    render :edit # edit action will render edit by default, but better to be explicit
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to tweets_url
    else
      render :edit
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:author_id, :body)
  end
end
