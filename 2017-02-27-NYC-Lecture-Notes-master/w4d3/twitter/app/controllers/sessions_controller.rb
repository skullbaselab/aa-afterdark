class SessionsController < ApplicationController
  #always use plural names for controller
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:name],
      params[:user][:password]
    )

    if user
      log_in(user)
      redirect_to tweets_url
    else
      render text: "It didn't work"
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
