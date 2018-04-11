class UsersController < ApplicationController
  #use before actions to restrict access to certain pages
  before_action :must_be_current_user, only: [:show]

  def new
    render :new
  end

  def create
    user = User.new(user_params) #it gets a session_token
    if user.save
      log_in(user) #session cookie token is set to user's session token
      redirect_to user_url(user.id) #passing in just user would work also
    else
      render text: "It didn't work"
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end

  def must_be_current_user
    if current_user.id != params[:id].to_i
      redirect_to tweets_url
    end
  end
end
