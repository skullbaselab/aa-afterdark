class TweetsController < ApplicationController
  def index
    tweets = Tweet.all

    # Translate ruby objects to JSON, a format the broswer understands, then
    # package up response and send it back (using render)
    # render json: tweets
    redirect_to 'http://google.com'
    # tomorrow we will discuss rendering Rails views
  end

  def show
    # request to /tweets/:id => rails will add :id to params hash
    tweet = Tweet.find(params[:id]) # automatically send 404 resonse if not found
    # the ::find method comes from Tweet inheriting frmo ActiveRecord::Base

    render json: tweet
  end

  def create
    tweet = Tweet.new(tweet_params)
    # tweet.user = current_user # once we get to auth

    if tweet.save # no bang, we don't want DB error
      render json: tweet
    else
      render json: tweet.errors, status: 422 # unprocessable entity
    end
  end

  private
  def tweet_params
    # strong params to whitelist only params we want for tweets
    params.require(:tweet).permit(:body, :user_id) # Probably don't want to allow user_id in real life. Today we'll live on the edge.
            # ^^ MUST have a key of tweet under params
                            # ^^ CAN have keys of body and user_id under params[:tweet], but don't have to
                            # CAN NOT have any keys under params[:tweet] other than :body, :user_id
    # Example:
    # params = {
    #   tweet: {
    #     body: 'super cool tweet',
    #     user_id: 500000
    #   },
    #   id: 1234,
    #   bad_thing: 'malicious input',
    #   other_thing: {
    #   some_stuff: 'asdf'
    #   }
    # }
    #
    # tweet_params = {
    #   body: 'super cool tweet',
    #   user_id: 500000
    # }
  end
end
