class Api::TweetsController < ApplicationController
  # TODO
  # protect create action
  # build through association
  before_action :require_logged_in, only: [:create]

  def index
    sleep 1
    render json: Tweet.order(created_at: :asc)
  end

  def create
    sleep 1
    # tweet = Tweet.new(tweet_params)
    # tweet.author_id = current_user.id

    tweet = current_user.tweets.new(tweet_params)

    if tweet.save
      render json: tweet
    else
      render json: tweet.errors, status: 422
    end
  end

  private

  def tweet_params
    # don't permit author_id!!! >:(
    params.require(:tweet).permit(:content)
  end

end
