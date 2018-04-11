class Api::TweetsController < ApplicationController
  # before_action :ensure_logged_in, only: [:create]

  def index
    # debugger
    @tweets = Tweet.order(created_at: :desc).includes(:author).limit(10)
    render json: @tweets
  end

  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)
    # randomly assign user until frontend authentication
    @tweet.author = User.all.sample

    if @tweet.save
      render json: @tweet
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
