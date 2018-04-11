class ReviewsController < ApplicationController
	# Question: How do I debug create actions?
	# Answer: Examine the params hash by using the server logs or failing loudly with better_errors
	

	# Question: How do we get additional data from database before we save
	# Answer: If it needs to come from the user, use the params and you can always run a query
	def create
		
		new_params = params[:review][:username].empty? ? {} : generate_new_params

		@review = Review.new(review_params.merge(new_params).except(:username))
		if @review.save
			redirect_to recipe_url(new_params[:recipe_id]) 
		else
			redirect_to recipe_url(params[:recipe_id])
		end
	end

	def edit
		# Establishing this review object allows us to prefill the edit form with data from the correct review
		@review = Review.find_by_id(params[:id])
		@recipe = Recipe.find_by_id(params[:recipe_id])
	end

	def update
		@review = Review.find_by_id(params[:id])
		user = User.find_by_username(params[:review][:username])
		user_id = user ? user.id : nil

		if @review.update(user_id: user_id, body: params[:review][:body])
			redirect_to recipe_url(params[:recipe_id])
		else
			render :edit
		end
	end

	def destroy
		@review = Review.find_by_id(params[:id])
		recipe = @review.recipe
		
		@review.destroy
		redirect_to recipe_url(recipe)
	end

	private

	def review_params	
		params.require(:review).permit(:username, :body)
	end

	def generate_new_params
		{		
			# Here we run an additonal query to get the user_id using the username passed into params through the request body
			user_id: User.find_by_username(params[:review][:username]).id,
			
			# Here we run get the recipe_id passed into params through the route params setup by nesting reviews under recipes
			# The route URI providing this parameter is: "/recipes/:recipe_id/reviews"
			recipe_id: params[:recipe_id]
		}
	end
end
