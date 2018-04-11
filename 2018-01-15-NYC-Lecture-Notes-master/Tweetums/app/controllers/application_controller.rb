class ApplicationController < ActionController::Base
  # all methods defined here are available in all controllers, since controllers inherit from this class
  
  
  protect_from_forgery with: :exception

  # don't forget helper_method
  # make these methods available to all views
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    # NB What does it mean to be logged in?
    # the session_token in cookies matches session_token in db!
    # Don't forget to make changes to the user and to the session hash!
    session[:session_token] = user.reset_session_token!
  end

  def logout
    # still want session token to be unique even when logged out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in
    # TODO
    #redirect_to new_session_url unless logged_in?
    render json: {error: ["Must be logged in"]}, status: 401 unless logged_in?
  end
  
  def ensure_logged_out
    #redirect_to tweets_url if logged_in?
  end
end
