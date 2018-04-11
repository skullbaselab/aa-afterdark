class Api::ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(title: params[:list][:title])

    if @list.save
      @list.user_ids = [params[:list][:user_id]]
      redirect_to list_url(@list)
    else
      redirect_to root_url
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
