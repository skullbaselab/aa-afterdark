class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      render json: @post
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = selected_post

    if @post
      render json: @post
    else
      render json: ["Could not find post"], status: 404
    end
  end


  def destroy
    @post = selected_post
    if @post
      @post.destroy
      render json: @post
    else
      render json: ["You cannot delete what you cannot find."], status: 404
    end
  end

  private
  def selected_post
    Post.find_by(id: params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :author_id, :publish_date)
  end
  
  
end
