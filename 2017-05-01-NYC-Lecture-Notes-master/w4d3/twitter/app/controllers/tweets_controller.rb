class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order('updated_at DESC').includes(:user)
    # render json: tweets
    render :index
  end

  def new
    @tweet = Tweet.new
    render :new
  end


  def create
    tweet = Tweet.new(tweet_params)
    tweet.user = User.all.sample

    if tweet.save
      # render json: tweet

      # makes a brand new request
      redirect_to tweets_url
    else
      render json: tweet.errors, status: 422
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])

    render :edit

  end

  def update
    tweet = Tweet.find(params[:id])

    if tweet.update(tweet_params)
      redirect_to tweets_url
    else
      render json: tweet.errors, status: 422
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
