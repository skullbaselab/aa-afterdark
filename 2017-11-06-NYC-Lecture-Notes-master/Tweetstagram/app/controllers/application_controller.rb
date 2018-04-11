class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper methods are available in views
  helper_method :current_user

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  #logged in user is the user with the same session token
  # that is stored in the session cookie
  # so to find that user, we query the database and search for the user with
  # the matching session token
  def current_user
    # below just an optimization
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_login
    # redirect_to new_session_url unless current_user
  end

end
