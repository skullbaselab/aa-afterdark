# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.destroy_all
User.destroy_all
Tweet.destroy_all

# stamford = Location.create!(name: "Stamford")
stamford = Location.new(name: "Stamford")
stamford.save!
# tassos = User.create!(name: "Tassos", location_id: stamford.id)
tassos = stamford.users.create!(name: "Tassos")
#create! raises an error if insertion fails (good feedback)
tweet = tassos.authored_tweets.create!(body: "What is twitter")
