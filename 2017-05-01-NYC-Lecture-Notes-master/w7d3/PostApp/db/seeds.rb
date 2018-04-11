# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.destroy_all
Comment.destroy_all

10.times do |i|
  p = Post.create!({ title: Faker::Superhero.name, body: Faker::Superhero.descriptor, like_count: rand(1..5) })
  
  5.times do |j|
    p.comments.create!( body: Faker::ChuckNorris.fact)
  end
end
