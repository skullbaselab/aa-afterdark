class Api::NotebooksController < ApplicationController
	def index
		@notebooks = Notebook.where(author_id: params[:user_id])
	end

	def show
		@notebook = Notebook.find_by_id(params[:notebook_id])
	end
end
