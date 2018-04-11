class DemosController < ApplicationController

  def wiki
    redirect_to 'http://wikipedia.org'
    return
    redirect_to tweets_url
  end

  def set_cookie
    session[:dae] = "awesome"
    session[:ommi] = "cool"
    render json: [session[:dae], session[:ommi]]
  end

  def ajax_demo
  end

end
