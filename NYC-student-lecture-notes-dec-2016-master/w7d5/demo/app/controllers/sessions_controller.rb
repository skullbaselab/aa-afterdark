class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user
      log_in!(@user)
      redirect_to '/'
    else
      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    log_out(current_user)
    redirect_to new_session_url
  end

end
