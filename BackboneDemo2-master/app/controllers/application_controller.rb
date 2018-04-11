class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # In Rails 4, POST without auth token will raise an error. Let's
  # forgo this protection for the moment.
  #protect_from_forgery with: :exception
end
