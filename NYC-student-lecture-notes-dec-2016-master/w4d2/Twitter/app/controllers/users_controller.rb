class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def new
    # .. this we will work on tomorrow ;)
  end

  def create
    if @user = User.create(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  def edit
    # .. this we will work on tomorrow ;)
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :bad_request 
    end
  end

  private

  def user_params 
    params.require(:user).permit(:username, :location_id)
  end

end
