class DogsController < ApplicationController
  def index
    @dogs = Dog.page(params[:page])
    respond_to do |format|
      format.html { render :index }
      format.json do
        render :json => {
          models: @dogs,
          page_number: params[:page],
          total_pages: @dogs.total_pages
        }
      end
    end
  end

  def show
    @dog = Dog.friendly.find(params[:id])
    render :show
  end
end
