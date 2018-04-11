class PiratesController < ApplicationController
  def index
    @pirates = Pirate.all
    
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @pirates }
    end
  end

  def show
    @pirate = Pirate.find(params[:id])
  end

  def new
    @pirate = Pirate.new
  end
  
  def create
    @pirate = Pirate.new(params[:pirate])
    if @pirate.save
      render json: @pirate
    else
      render json: @pirate.errors.full_messages, status: 422
    end
  end
end
