class Api::TweetsController < ApplicationController

  def index
    sleep 1
    render json: Tweet.order(created_at: :asc)
  end

  def create
    sleep 1
    tweet = Tweet.new(tweet_params)
    if tweet.save
      render json: tweet
    else
      render json: tweet.errors, status: 422
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
