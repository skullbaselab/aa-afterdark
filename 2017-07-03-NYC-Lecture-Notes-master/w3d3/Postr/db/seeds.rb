# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
user1 = User.create!(username: "Matt")
user2 = User.create!(username: "Julian")
#
Post.destroy_all
post1 = Post.create!(body: "Just me and bro OJ (Orange Julian) chillin in lecture!", author_id: user1.id)
post2 = Post.create!(body: "Nobody is allowed to call me Orange Julian, it's not not funny!", author_id: user2.id)

Comment.destroy_all
comment1 = Comment.create!(post_id: post1.id, commenter_id: user2.id, body: "Shut up, Matt")
comment2 = Comment.create!(post_id: post2.id, commenter_id: user1.id, body: "ha ha ha, that's so funny!")

# Like.destroy_all
# like1 = Like.create!(user_id: user1.id, post_id: post2.id)
# like2 = Like.create!(user_id: user2.id, post_id: post1.id)
