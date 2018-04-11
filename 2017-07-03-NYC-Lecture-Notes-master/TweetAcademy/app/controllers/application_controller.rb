class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  # allows us to use these methods in Views

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    # the purpose of @current_user is to avoid the query if we just logged them in
    # in the current request
  end

  def login(user)
    #what does it mean to be logged in? turn and talk...
    session[:session_token] = user.reset_session_token!
                              # make sure you write it with a BANG
                              # YOU HAVE BEEN WARNED
    @current_user = user
  end

  def logout
    current_user.reset_session_token!
    # ^use the method because it's possible that @current_user is still nil
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end
end
