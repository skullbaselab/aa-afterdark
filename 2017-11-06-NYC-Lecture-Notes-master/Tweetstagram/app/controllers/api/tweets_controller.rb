class Api::TweetsController < ApplicationController
  # before_action :ensure_logged_in, only: [:create]

  def index
    # including author here because we iterate over tweets and call tweet.author on each in jbuilder; prevents an N+1 query
    @tweets = Tweet.order(created_at: :desc).includes(:author, :comments)
    # render json: @tweets
    render :index
  end

  def show
    @tweet = Tweet.find(params[:id])
    render :show
  end

  def create
    @tweet = Tweet.new(tweet_params)
    # randomly assign user until frontend authentication
    @tweet.author = User.all.sample

    if @tweet.save
      render :show
    else
      render json: @tweet.errors.full_messages, status: 422
    end

  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    render json: {}
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
