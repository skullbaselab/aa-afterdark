class Api::UsersController < ApplicationController

  # before_action :redirect_if_its_not_you, only: :show

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # login method inherited from ApplicationController
      login(@user)
      # redirect_to tweets_url
      render :show
    else
      # use flash.now when rendering, flash for redirecting
      # flash.now[:errors] = @user.errors.full_messages
      render json: @user.errors.full_messages, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def redirect_if_its_not_you
    redirect_to tweets_url unless current_user && current_user.id == params[:id].to_i
  end

end
