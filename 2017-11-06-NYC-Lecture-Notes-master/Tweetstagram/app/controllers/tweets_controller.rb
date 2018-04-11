# uppercase, CamelCase, plural for controller class names
# lowercase snake_case, plural for controller file names
class TweetsController < ApplicationController

  # ensure_login is defined in ApplicationController
  # to make sure only logged in users can make tweets
  before_action :ensure_login, only: [:new, :create]

  def index
    @tweets = Tweet.all
    # render :index
    # in our ajax request we specified we want a json response

    respond_to do |format|
      format.html { render :index }
      # don't be confused by render, it just means build, not actually showing anything on the page with the data
      format.json { render json: @tweets }
      # below will cause promise's fail callback to be called because of the status code
      # format.json { render json: ["badbadbad!"], status: 401 }
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    # render :show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @tweet }
    end
  end

  def new
    @tweet = Tweet.new
    render :new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.author = current_user

    respond_to do |format|
      format.html do
        if @tweet.save
          redirect_to tweet_url(@tweet)
        else
          flash.now[:errors] = @tweet.errors.full_messages
          render :new
        end
      end

      format.json do
        if @tweet.save
          render json: @tweet
        else
          render json: @tweet.errors.full_messages, status: 422
        end
      end
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      render json: tweet
    else
      render json: tweet.errors.full_messages, status: 422
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    # tweet object still exists after destroy so you could render it if you wanted
    render json: ['The tweet has been destroyed']
  end

  private

  def tweet_params
    # blocks any other params not specified
    params.require(:tweet).permit(:body)
  end
end
