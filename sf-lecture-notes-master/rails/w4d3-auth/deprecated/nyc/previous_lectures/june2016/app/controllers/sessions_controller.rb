class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:name],
      params[:user][:password]
    )
    
    if user
      log_in(user)
      redirect_to users_url
    else
      flash[:errors] = ["Login failed. Try again!"]
      render :new
    end
  end

  def new
    render :new
  end

  def destroy
    log_out
    redirect_to users_url
  end



















  def get_cookie
    # secret = cookies.signed[:my_secret]
    secret = session[:my_secret]
    render text: "Secret: #{secret} Flash: #{flash[:notice]}"
  end

  def set_cookie
    secret = "Not all biscuits are edible"
    # cookies.signed[:my_secret] = secret
    # session is one big cookie, which holds key value pairs
    session[:my_secret] = secret
    render text: "Ha, I have a secret"
  end

  def set_flash
    notice = params[:notice]
    flash.now[:notice] = notice
    # flash[:notice] = notice
    # flash is really good for redirect_to
    # flash sets a cookie only for the next request
    # flash.now let's you set information for this request
    render text: "Flash: #{flash[:notice]}"
    # redirect_to(get_cookie_url)
  end
end
