class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    
    if @like.save
      render json: @like
    else
      render json: @like.errors.full_messages, status: 400
    end
  end

  def index
    @likes = params[:user_id] ? User.find(params[:user_id]).likes : Like.all
    render json: @likes
  end
  
  def show
    @like = Like.find_by(id: params[:id])
    
    if @like
      render json: @like
    else
      render json: ["No such like."], status: 404
    end
  end
  
  def destroy
    @like = Like.find_by(id: params[:id])

    if @like
      @like.destroy
      render json: @like
    else
      render json: ['You cannot destroy that which you cannot find.'], status: 404
    end
  end
  
  
  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
