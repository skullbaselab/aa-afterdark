class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)

    @post.author_id = User.first.id

    if @post.save
      redirect_to post_url(@post)
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  def edit
    @post = selected_post
    render :edit
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = selected_post

    if @post
      render :show
    else
      render json: ["Could not find post"], status: 404
    end
  end


  def destroy
    @post = selected_post
    if @post
      @post.destroy
      redirect_to posts_url
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
