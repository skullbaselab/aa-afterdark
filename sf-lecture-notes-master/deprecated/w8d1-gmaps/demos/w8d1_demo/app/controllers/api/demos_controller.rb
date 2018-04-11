class Api::DemosController < ApplicationController
  def index
    @demos = Demo.all
    if query
      @demos = @demos.where('name LIKE ?', "%#{query}%")
    end
    if params[:min_price] && params[:max_price]
      @demos = @demos.where(price: price_range)
    end
    render :index
  end

  private
  def query
    params[:query]
  end

  def price_range
    params[:min_price]..params[:max_price]
  end
end
