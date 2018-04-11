# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
jersey = Location.create!(name: "New Jersey")
new_york = Location.create!(name: "New York")
california = Location.create!(name: "California")
the_block = Location.create!(name: "The Block")
miami = Location.create!(name: "Miami")

User.destroy_all
User.create!([
  { username: "rubynewbie",
    location_id: california.id,
    password: 'starwars'
  }, {
    username: "mauricimoe",
    location_id: jersey.id,
    password: 'starwars'
  }, {
    username: "nohablocss",
    location_id: new_york.id,
    password: 'starwars'
  }, {
    username: "mikearoni",
    location_id: jersey.id,
    password: 'starwars'
  }, {
    username: "gasparthefriendlyghost",
    location_id: miami.id,
    password: 'starwars'
  }, {
    username: "jenny",
    location_id: the_block.id,
    password: 'starwars'
  }, {
    username: "ringmaster",
    location_id: california.id,
    password: 'starwars'
  }, {
    username: "gem_install_abby",
    location_id: california.id,
    password: 'starwars'
  }, {
    username: "m-m-m-m-matt",
    location_id: new_york.id,
    password: 'starwars'
  }
])

Tweet.destroy_all
User.all.each do |user|
  5.times do
    Tweet.create!(body: "#{Faker::Overwatch.quote}", author_id: user.id)
  end
end

HashTag.destroy_all
hashtags = HashTag.create!([
  {body: "#awesome"},
  {body: "#sick"},
  {body: "#thefutureisnow"}
])

HashTagging.destroy_all
Tweet.all.each do |tweet|
  HashTagging.create!(tweet_id: tweet.id, hash_tag_id: hashtags.sample.id)
end
