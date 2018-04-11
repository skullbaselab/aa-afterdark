class Api::TweetsController < ApplicationController
  
  before_action :ensure_logged_in
  
  def index
    @tweets = Tweet.includes(:author).order(created_at: :desc)
    render :index
  end

  def show
    @tweet = Tweet.find(params[:id])
    render :show
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.author_id = current_user.id

    if @tweet.save
      render :show
    else
      render json: {errors: @tweet.errors.full_messages}, status: 422
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      render :show
    else
      render json: {errors: @tweet.errors.full_messages}, status: 422
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet && tweet.author_id == current_user.id
      tweet.destroy
      render json: {}
    elsif tweet && tweet.author_id != current_user.id
      render json: {error: ["Destroy your own tweets, jabroni"]}, status: 403
    else
      render json: {error: ["Couldn't find that tweet"]}, status: 404
    end
  end


  # Now that we've moved to Single Page Apps / client side rendering,
  # we no longer need these actions:
  # def new
  #   @tweet = Tweet.new
  # end
  #
  # def edit
  #   @tweet = Tweet.find(params[:id])
  # end


  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
