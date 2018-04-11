# Namespace::ResourceController
class Api::TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user, :hash_tags).order(updated_at: :desc)

    # json = @tweets.map do |tweet|
    #   {
    #     id: tweet.id,
    #     body: tweet.body,
    #     author: {
    #       id: tweet.user.id,
    #       name: tweet.user.name
    #     }
    #   }
    # end
    render :index
  end

  def show
    @tweet = Tweet.find(params[:id])

    render :show
  end
end
