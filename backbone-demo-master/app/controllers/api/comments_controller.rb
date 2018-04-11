class Api::CommentsController < ApplicationController
  def create
    @comment = TodoComment.new(params[:comment])
    if @comment.save
      render "comments/show"
    else
      render :json => @comment.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @comment = TodoComment.find(params[:id])
    @comment.destroy
    render "comments/show"
  end

  def index
    @comments = TodoComment.where(:todo_id => params[:todo_id])
    render "comments/index"
  end
  
  def show
    @comment = TodoComment.find(params[:id])
    render "comments/show"
  end

  def update
    @comment = TodoComment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      render "comments/show"
    else
      render :json => @comment.errors, :status => :unprocessible_entity
    end
  end
end