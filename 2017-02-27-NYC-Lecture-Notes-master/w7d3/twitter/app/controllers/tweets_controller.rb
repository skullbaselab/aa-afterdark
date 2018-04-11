class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(updated_at: :desc).includes(:user)

    render :index
  end

  def new
    @tweet = Tweet.new
    render :new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to tweets_url
    else
      render :new
    end
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])

    render :edit
  end

  def update
    @tweet = current_user.tweets.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to tweets_url
    else
      render :edit
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
