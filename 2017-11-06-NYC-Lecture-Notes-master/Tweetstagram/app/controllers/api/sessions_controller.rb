class Api::SessionsController < ApplicationController
  def new
  end

  def create
    # don't need strong params here because we're not creating a new user
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login(@user)
      # redirect_to tweets_url
      render 'api/users/show.json.jbuilder'
    else
      # flash.now[:errors] = @user.errors.full_messages
      render json: @user.errors.full_messages
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      @current_user = nil
      session[:session_token] = nil
    end
    render 'static_pages/root'
  end

end
