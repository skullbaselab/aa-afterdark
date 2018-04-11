class Api::UsersController < ApplicationController

  before_action :ensure_logged_in, only: [:index]
  
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)
    @user.location_id = Location.all.sample.id
    if @user.save
      login(@user)
      render :show
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
