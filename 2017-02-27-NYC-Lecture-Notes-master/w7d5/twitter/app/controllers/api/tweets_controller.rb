class Api::TweetsController < ApplicationController

  def index
    sleep 1
    @tweets = Tweet.all
    render :index
  end

  def create
    sleep 1
    @tweet = current_user.tweets.new(content: params[:tweet][:content])
    if @tweet.save
      render :show
    else
      render json: @tweet.errors, status: 422
    end
  end
end
