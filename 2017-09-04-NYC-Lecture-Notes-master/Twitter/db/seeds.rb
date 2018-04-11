# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
State.destroy_all
florida = State.create!({name: "Florida"})
pr = State.create!({name: "Puerto Rico"})
new_york = State.create!({name: "New York"})
california = State.create!({name: "California"})
rocky_mountain = State.create!({name: "Rocky Mountain"})
jersey = State.create!({name: "Jersey"})
pennsylvania = State.create!({name: "Pennsylvania"})
maryland = State.create!({name: "Maryland"})
argentina = State.create!({name: "Argentina"})
switzerland = State.create!({name: "Switzerland"})

users = []
User.destroy_all
users << User.create!(username: "alamoe", password: 'starwars', state: jersey)
users << User.create!(username: "mikearoni", password: 'starwars', state: jersey)
users << User.create!(username: "al", password: 'starwars', state: florida)
users << User.create!(username: "tomi", password: 'starwars', state: argentina)
users << User.create!(username: "mashupishu", password: 'starwars', state: argentina)
users << User.create!(username: "badjuju", password: 'starwars', state: maryland)
users << User.create!(username: "hawsoleum", password: 'starwars', state: rocky_mountain)
users << User.create!(username: "pickle", password: 'starwars', state: california)
users << User.create!(username: "mearg", password: 'starwars', state: california)
users << User.create!(username: "ali_kat", password: 'starwars', state: pennsylvania)
users << User.create!(username: "osczar", password: 'starwars', state: new_york)
users << User.create!(username: "kurstie", password: 'starwars', state: pr)
users << User.create!(username: "dannycisme", password: 'starwars', state: new_york)
users << User.create!(username: "matthi", password: 'starwars', state: switzerland)

Tweet.destroy_all
100.times do
  Tweet.create!(author_id: users.sample.id, body: Faker::Lovecraft.sentence)
end
