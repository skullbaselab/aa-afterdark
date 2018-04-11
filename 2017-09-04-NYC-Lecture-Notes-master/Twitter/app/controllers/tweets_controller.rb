class TweetsController < ApplicationController

  before_action :ensure_logged_in, only: [:new, :create]

  def index # gimme all the things
    @tweets = Tweet.order(created_at: :desc).includes(:author)
    render :index
  end

  def show # gimme one of the things
    @tweet = Tweet.find(params[:id])
    render :show
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.author = current_user
    respond_to do |format|
      format.html do
        if tweet.save
          redirect_to tweet_url(tweet)
        else
          flash.now[:errors] = tweet.errors.full_messages
          render :new, status: :unprocessable_entity
        end
      end

      format.json do
        if tweet.save
          render json: tweet
        else
          render json: tweet.errors.full_messages, status: 422
        end
      end
    end

  end

  def edit
    @tweet = Tweet.find(params[:id])
    render :edit
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_url(@tweet)
    else
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_url
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end













# comment
