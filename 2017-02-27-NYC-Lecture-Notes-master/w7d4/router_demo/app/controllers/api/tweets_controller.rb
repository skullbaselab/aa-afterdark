class Api::TweetsController < ApplicationController

  def index
    sleep 1
    @tweets = Tweet.order(created_at: :asc)
    render :index
  end

  def create
    sleep 1
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      render :show
    else
      render json: tweet.errors, status: 422
    end
  end

  def show
    sleep 1
    @tweet = Tweet.find(params[:id])
    if @tweet
      render :show
    else
      render json: @tweet.errors, status: 422
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
