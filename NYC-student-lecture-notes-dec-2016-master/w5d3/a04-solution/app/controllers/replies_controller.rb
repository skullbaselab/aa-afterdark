class RepliesController < ApplicationController
  before_action :require_signed_in!

  def create
    reply = Reply.new(reply_params)
    if reply.save
      redirect_to tweet_url(reply.tweet)
    else
      @tweet = Tweet.find(reply_params[:tweet_id])
      flash.now[:errors] = reply.errors.full_messages
      render 'tweets/show'
    end

  end

  def destroy
    reply = Reply.find(params[:id])
    reply.destroy

    redirect_to tweet_url(reply.tweet)
  end

  private
  def reply_params
    params.require(:reply).permit(:body, :tweet_id)
  end
end
