class SessionsController < ApplicationController

  ###################
  #     Cookies     #
  ###################

  def set_cookie
    # normal cookie
    # not THE rails session cookie
    cookies[:stuff] = "things"
    render text: "cookie set!"
  end

  def get_cookie
    # normal cookie
    render text: cookies[:stuff]
  end

  def set_flash
    # flash[:notice] = "hello from the flash"
    flash.now[:notice] = "hello from flash now"
    render text: flash[:notice]
    # redirect_to get_flash_url
  end

  def get_flash
    render text: flash[:notice]
  end



  ###################
  #       Auth      #
  ###################

  def new

  end

  def create
    @user = User.find_by_credentials(
      params[:user][:name],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to tweets_url
    else
      flash.now[:errors] = ["invalid credentials"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
