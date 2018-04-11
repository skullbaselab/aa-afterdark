class StaticPagesController < ApplicationController

  def hello
    type = params[:type]
    weather = params[:weather] || 'fine'
    render json: ["Hello #{type} world! The weather is #{weather}."], status: 200
  end

  def hacking
    debugger
    redirect_to "http://i.giphy.com/yUlFNRDWVfxCM.gif"
  end

end
