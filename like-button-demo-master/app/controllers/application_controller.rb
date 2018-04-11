class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user

  # def current_user
  #   return nil unless session[:session_token]
  #   @current_user ||= User.find_by_session_token(session[:session_token])
  # end

  def current_user
    @current_user ||= User.find_by_username("markov")
  end

  # def sign_in!(user)
  #   user.reset_session_token!
  #   session[:session_token] = user.session_token
  # end
  #
  # def sign_out!
  #   session[:session_token] = nil
  #   current_user && current_user.reset_session_token!
  # end

  def signed_in?
    !!current_user
  end
end
