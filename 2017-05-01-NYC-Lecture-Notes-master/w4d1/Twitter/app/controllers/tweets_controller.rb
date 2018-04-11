class TweetsController < ApplicationController

  # conventional routes/actions in Rails:
    # create - adds a new instance to the DB ( POST request )
    # index - brings back a collection of (or all of) a specific model ( GET )
    # show - brings back one particular instance of an object ( GET )

    # here are the others: new, edit, update, destroy

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      render json: tweet
    else
      render json: tweet.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    # self.render({text: "Hi class!"})
    # Rails to convention to write this as:
    # render text: "Hi class!"

    tweets = Tweet.all
    render json: tweets
  end

  def show
    tweet = Tweet.find(params[:id])
    render json: tweet
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :author_id)
  end

end
