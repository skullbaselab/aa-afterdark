class Api::NotesController < ApplicationController
	def index
		@notes = Note.all
	end

	def show
		@note = Note.find_by_id(params[:id])
	end
end
