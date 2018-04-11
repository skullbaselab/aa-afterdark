# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Country.destroy_all
argentina = Country.create!(name: "Argentina")
usa = Country.create!(name: "USA")
belgium = Country.create!(name: "Belgium")
dogland = Country.create!(name: "Dog land")

User.destroy_all
tommy = User.create!(name: "Tommy", country_id: argentina.id)
leen = User.create!(name: "Leen", country_id: belgium.id)
daniel = User.create!(name: "Daniel", country_id: usa.id)
maurice = User.create!(name: "Maurice", country_id: usa.id)
fred = User.create!(name: "Fred", country_id: usa.id)
patrick = User.create!(name: "Patrick", country_id: usa.id)
carl = User.create!(name: "Carl", country_id: usa.id)
gigi = User.create!(name: "Gigi", country_id: usa.id)
ella = User.create!(name: "Ella", country_id: dogland.id)
luna = User.create!(name: "Luna", country_id: dogland.id)
napoleon = User.create!(name: "Napoleon", country_id: dogland.id)

Tweet.destroy_all

patrick_tweet_1 = patrick.tweets.create!(body: "controller? More like cool-troller!")
patrick_tweet_2 = patrick.tweets.create!(body: "Break time everybody")
