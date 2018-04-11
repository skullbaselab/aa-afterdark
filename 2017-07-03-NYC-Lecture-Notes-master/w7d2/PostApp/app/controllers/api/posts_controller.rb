class Api::PostsController < ApplicationController
  def index
    debugger
    posts = Post.all
    render json: posts
  end

  def update
    post = Post.find(params[:id])

    if post.update(post_params)
      render json: post
    else
      render json: post.errors.full_messages
    end
  end

  private

  def post_params
    # Remember: permit filters out other attributes in the Object
    # that are not explicitly permitted (aka: the post.id)
    params.require(:post).permit(:title, :body, :like_count)
  end
end
