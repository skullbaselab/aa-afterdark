class Api::TweetsController < ApplicationController
  #THIS IS FOR COOKIE DEMO PURPOSES ONLY!!!!!!!!
  # def set_cookie
  #   cookies[:cool_cookie] = 'I am one cool cookie'
  #   render plain: "I am setting the cookie"
  # end
  #
  # def get_cookie
  #   render plain: cookies[:cool_cookie]
  # end
  #
  # def set_session
  #   session[:secret_cool_cookie] = "Shh I am a secret"
  #   render plain: "I am setting the secret cookie"
  # end
  #
  # def get_session
  #   render plain: session[:secret_cool_cookie]
  # end
  #
  # def set_flash
  #   flash.now[:demo_flash] = "Will we see this?"
  #   render plain: flash[:demo_flash]
  #   # redirect_to "/get_flash"
  # end
  #
  # def get_flash
  #   render plain: flash[:demo_flash]
  # end

      #what if it's flash.now?

  ###############################
  # Real tweets controller stuff#
  ###############################

  # before_action :ensure_logged_in, only: [:new, :edit, :update]
                                  # only do ensure_logged_in before these actions
  # before_action :ensure_logged_in, except: [:index, :show]
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.author = User.all.sample #nice one al

    # @tweet = current_user.tweets.new(tweet_params)
                  # this line automagically sets the author_id to current_user.id
    if @tweet.save
      # redirect_to tweets_url
      render :show
    else
      # flash.now[:errors] = @tweet.errors.full_messages
      # render :new
      render json: @tweet.errors.full_messages, status: 422
    end
  end

  def new
    @tweet = Tweet.new
    render :new
  end

  def edit
    @tweet = Tweet.find(params[:id])
    render :edit
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    render json: {}
  end

  def index # this one is cool for users that are not logged in
    @tweets = Tweet.all.order(updated_at: "DESC").includes(:author)
    render :index
  end

  def show
    tweet = Tweet.find(params[:id])
    render json: tweet
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweets_url
    else
      flash.now[:errors] = @tweet.errors.full_messages
      render :edit
      # render json: @tweet.errors.full_messages, status: 422
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
