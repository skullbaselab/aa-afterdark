# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.destroy_all
jersey = Location.create!(name: "Jersey")
argentina = Location.create!(name: "Argentina")
florida = Location.create!(name: "Florida")
pa = Location.create!(name: "Pennsylvania")
california = Location.create!(name: "California")
nyc = Location.create!(name: "NYC")
pr = Location.create(name: "Puerto Rico")
mass = Location.create!(name: "Massachusetts")
catzastan = Location.create!(name: "Catzasatan")
ctu = Location.create!(name: "CTU")

User.destroy_all
tommy = User.create!(username: "tommy_pickles", location_id: argentina.id, password: "starwars")
fred = User.create!(username: "freducation", location_id: mass.id, password: "starwars")
daniel = User.create!(username: "daniel_james_colson", location_id: mass.id, password: "starwars")
patrick = User.create!(username: "patrick_or_treat", location_id: california.id, password: "starwars")
maurice = User.create!(username: "almighty_sosa", location_id: jersey.id, password: "starwars")
kurstie = User.create!(username: "kurstiel_a_car", location_id: pr.id, password: "starwars")
oscar = User.create!(username: "o_scar_from_lion_king", location_id: nyc.id, password: "starwars")
meagan = User.create!(username: "meagan_tron", location_id: california.id, password: "starwars")
al = User.create!(username: "al_dente", location_id: florida.id, password: "starwars")
mike = User.create!(username: "kens_brother", location_id: jersey.id, password: "starwars")
ali = User.create!(username: "ali_baba", location_id: pa.id, password: "starwars")
danny = User.create!(username: "danza_kuduro", location_id: nyc.id, password: "starwars")
chloe = User.create!(username: "chloe_o'brian", location_id: ctu.id, password: "starwars")
jack = User.create!(username: "jack_bauer", location_id: ctu.id, password: "starwars")

Tweet.destroy_all

User.all.each do |user|
  user.tweets.create!(body: "My name is #{user.username}")
  user.tweets.create!(body: "Breaktime, everybody!")
  user.tweets.create!(body: "You can do it!")
  user.tweets.create!(body: "Ayyyy lmao")
  user.tweets.create!(body: Faker::ChuckNorris.fact)
  user.tweets.create!(body: Faker::Hipster.sentence)
  user.tweets.create!(body: Faker::Hacker.say_something_smart)
end
