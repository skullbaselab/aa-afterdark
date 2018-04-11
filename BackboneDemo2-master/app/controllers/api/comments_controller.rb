class Api::CommentsController < ApplicationController
  def create
    @comment = TodoComment.new(self.comment_params)
    if @comment.save
      render "show"
    else
      render :json => @comment.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    @comment = TodoComment.find(params[:id])
    @comment.destroy!
    render "show"
  end

  def index
    @comments = TodoComment.where(:todo_id => params[:todo_id])
    render "index"
  end

  def show
    @comment = TodoComment.find(params[:id])
    render "show"
  end

  def update
    @comment = TodoComment.find(params[:id])
    if @comment.update_attributes(self.comment_params)
      render "show"
    else
      render :json => @comment.errors, :status => :unprocessable_entity
    end
  end

  protected
  def comment_params
    self.params[:comment].permit(:todo_id, :content)
  end
end
