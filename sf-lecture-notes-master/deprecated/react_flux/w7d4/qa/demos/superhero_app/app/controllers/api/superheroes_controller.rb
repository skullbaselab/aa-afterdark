class Api::SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
    # render json: @superheroes
    render :index
  end

  def show
    @superhero = Superhero.find_by(id: params[:id])
    # render json: @superhero
    render :show
  end
end
