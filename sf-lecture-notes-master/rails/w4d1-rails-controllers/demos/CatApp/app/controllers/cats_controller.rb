class CatsController < ApplicationController
  def index
    render json: Cat.all
  end

  def create
    cat = Cat.new(cat_params)

    if cat.valid?
      cat.save
      render json: cat
    else
      render json: cat.errors.full_messages
    end
  end

  def update
    cat = Cat.find_by(id: params[:id])

    if cat.update(cat_params)
      render json: cat
    else
      render json: cat.errors.full_messages
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    cat.destroy
    render json: cat
  end

  def show
    cat = Cat.find_by(id: params[:id])
    render json: cat
  end

  def happy_kitty
    cat = Cat.find_by(name: params[:name])
    render json: cat
  end

  private

  def cat_params
    params.require(:cat).permit(:name)
  end
end





#   cat = Cat.find(params[:id])
#   cat.destroy
#   render json: cat
# rescue ActiveRecord::RecordNotFound
#   render json: ["no such cat :("]
