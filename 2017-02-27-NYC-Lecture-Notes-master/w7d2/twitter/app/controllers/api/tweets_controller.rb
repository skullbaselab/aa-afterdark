class Api::TweetsController < ApplicationController

  def index
    debugger
    sleep 1
    render json: Tweet.order(created_at: :asc)
  end

  def create
    sleep 1
    tweet = Tweet.new(content: params[:tweet][:content])
    if tweet.save
      render json: tweet
    else
      render json: tweet.errors, status: 422
    end
  end

end
