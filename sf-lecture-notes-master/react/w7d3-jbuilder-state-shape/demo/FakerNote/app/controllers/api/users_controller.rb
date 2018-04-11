class Api::UsersController < ApplicationController
	def index
		@users = User.all.limit(7)
	end

	def show
		@user = User.find_by_id(params[:user_id])
	end
end
