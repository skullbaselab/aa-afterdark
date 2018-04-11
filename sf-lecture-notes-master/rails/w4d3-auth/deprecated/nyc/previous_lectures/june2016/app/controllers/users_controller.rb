class UsersController < ApplicationController

  before_action :redirect_if_not_logged_in
  def index
    @users = User.all.includes(:country)
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end


  private
  def redirect_if_not_logged_in
    unless logged_in?
      flash[:notice] = ["You must be logged in to see this page"]
      redirect_to(new_session_url)
    end
  end

  def user_params
    params.require(:user).permit(:name, :country_id)
  end

end
