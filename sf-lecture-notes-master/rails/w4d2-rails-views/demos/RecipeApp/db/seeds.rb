# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def generate_ingredients
	ingredients = (1..(rand(15) + 1)).to_a
	ingredients.map! do |n|
		"#{n}. #{Faker::Food.ingredient}"
	end
	
	ingredients.join("\n")
end

def generate_directions
	directions = (1..(rand(10) + 1)).to_a
	directions.map! do |n|
		"#{Faker::Hacker.verb} #{Faker::Hacker.noun}"
	end
	
	directions.join("\n")
end

def generate_username
	loop do
		username = Faker::Internet.user_name 
		return username unless User.exists?(username: username)
	end
end

def generate_recipe_id(n)
	loop do
		id = rand(1000)
		return id unless Review.exists?(user_id: n, recipe_id: id)
	end
end

100.times do |n|
	User.create!(username: generate_username)
	
	rand(10).times do |x|
		Recipe.create!(name: Faker::Book.title,
									 author_id: n,
									 image_url: Faker::Avatar.image,
									 ingredients: generate_ingredients,
									 description: Faker::Hipster.paragraph(1),
									 directions: generate_directions
									 )
	end

	rand(100).times do
		Review.create!(user_id: n, 
									 recipe_id: generate_recipe_id(n), 
									 body: Faker::Hipster.paragraph(1)
									 )
	end
end




