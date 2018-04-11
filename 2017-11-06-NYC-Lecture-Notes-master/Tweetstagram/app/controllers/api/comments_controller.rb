class Api::CommentsController < ApplicationController
  def index
    @comments = Tweet.find(params[:tweet_id]).comments
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    render :destroy
  end
end
