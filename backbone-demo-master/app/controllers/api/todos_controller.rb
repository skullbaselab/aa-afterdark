class Api::TodosController < ApplicationController
  def create
    @todo = Todo.new(params[:todo])

    if @todo.save
      render "todos/show"
    else
      render :json => @todo.errors, :status => :unprocessable_entity
    end
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render "todos/show"
    else
      raise "WTF?"
    end
  end
  
  def index
    @todos = Todo.all
    render "todos/index"
  end
  
  def show
    @todo = Todo.find(params[:id])
    @comments = @todo.comments
    render "todos/show"
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(params[:todo])
      render "todos/show"
    else
      render :json => @todo.errors, :status => :unprocessable_entity
    end
  end
end
