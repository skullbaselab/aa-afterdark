class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #this lets us use the passed in methods in our views!
  helper_method :current_user

  def current_user
    #use lazy assignment with ivar to minimize sql queries
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in(user)
    #set the session token cookie equal to the return value of user.reset_session_token!
    session[:session_token] = user.reset_session_token!
    #rails gives access to session cookie with hash-like interface
  end

  def log_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
  end
end
