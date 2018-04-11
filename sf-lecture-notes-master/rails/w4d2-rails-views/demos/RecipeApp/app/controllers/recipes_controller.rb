class RecipesController < ApplicationController
	def show
		# Question: Where does this params[:id] come from?
		# Answer: Route Params created when making route with URI: "/recipes/:id"
		@recipe = Recipe.find_by_id(params[:id])
		@ingredients = @recipe.ingredients.lines
		@directions = @recipe.directions.lines
		@reviews = @recipe.reviews.order(created_at: :desc)
	end

	def index
		@recipes = Recipe.all
	end

	def destroy
		if @recipe.destroy
			redirect_to recipes_url
		else
			render :show
		end
	end
end
