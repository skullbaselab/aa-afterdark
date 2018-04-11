class Api::TodosController < ApplicationController
  before_action :deny_access_if_not_logged_in

  def index
    @todos = Todo.includes(:tags, :steps).where(user_id: current_user.id)
    render :index
  end

  def show
    @todo = Todo.includes(:tags, :steps).find(params[:id])
    render :show
  end

  def create
    # we're doing a new through the association presets the user_id to the current_user's id
    @todo = current_user.todos.includes(:steps, :tags).new(todo_params)
    if @todo.save
      render :show
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = current_user.todos.includes(:steps, :tags).find(params[:id])
    @todo.destroy
    render :show
  end

  def update
    @todo = Todo.includes(:steps, :tags).find(params[:id])
    if @todo.update(todo_params)
      render :show
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :done, tag_names: [])
  end
end
