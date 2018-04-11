class Api::PostsController < ApplicationController
  # use before_action to protect our routes using good ol' auth
  def index
    @posts = Post.all.includes(:comments)
    # render json: posts.to_json(include: :comments) # nested include
    # sending up ALL of the post data and ALL of the comment data
    # too. much.
    # there's no sensitive data here, but we'd want to protect that if there were

    # we have to send back some response
    # previously we just rendered whole JSON objects
    # now we'll curate with JBuilder
    render :index # (in whatever format was specified, if there are options)


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
    params.require(:post).permit(:title, :body, :like_count)
  end
end
