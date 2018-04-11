class TweetsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      tweets = user.tweets
    else
      tweets = Tweet.all
    end
    render json: tweets
  end

  def show
    tweet = Tweet.find(params[:id])
    render json: tweet
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      render json: tweet
    else
      render json: tweet.errors.full_messages, status: 422
    end
  end

  def update
    tweet = Tweet.find(params[:id])

    if tweet.update(tweet_params)
      render json: tweet
    else
      render json: tweet.errors.full_messages, status: 422
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:author_id, :body)
  end
end
