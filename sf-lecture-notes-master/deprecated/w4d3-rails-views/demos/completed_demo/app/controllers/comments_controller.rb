class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_url(@comment.article)
  end

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
