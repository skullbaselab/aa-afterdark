class SessionsController < ApplicationController

  ###################
  #     Cookies     #
  ###################

  def set_cookie
    cookies[:stuff] = "Things!"
    render text: "Cookie set!"
  end

  def get_cookie
    render text: cookies[:stuff]
  end

  def set_flash
    flash.now[:notice] = "whatever I want"
    render text: flash[:notice]
  end

  def get_flash
    render text: flash[:notice]
  end

  ###################
  #       Auth      #
  ###################

  def new
    render :new
    #log in form
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    #nest under user because these attributes refer to the user
    if user
      log_in(user)
      redirect_to tweets_url
    else
      flash.now[:errors] = ["Login failed. Try again!"]
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
