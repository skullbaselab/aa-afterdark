class Api::TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def create
    # // debugger
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      render :show
    else
      render json: @tweet.errors.full_messages
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
