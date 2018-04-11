class UsersController < ApplicationController
  def index
    # redirect_to "http://www.google.com"     # That's not RESTful!
    # can't redirect and render in the same action!
    @users = User.all.includes(:country)
    render :index
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      # if @user.save fails, @user.errors.full_messages will show validation errors
      render :new
      # the new VIEW, NOT the new action
    end
  end

# new -> GET reqeust for a blank form
# create -> POST request (submitting the form)
  def new
    @user = User.new #dummy so our view doesn't break
    render :new
  end


  # edit -> update, like new -> create
  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
      # redirect_to user_url(@user)
    else
      # render json: @user.errors, status: :unprocessable_entity
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end


  private

  def user_params
    params.require(:user).permit(:name, :country_id)
  end

end
