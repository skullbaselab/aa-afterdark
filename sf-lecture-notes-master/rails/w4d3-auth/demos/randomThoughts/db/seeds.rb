User.destroy_all
Post.destroy_all
Like.destroy_all

user1 = User.create(username: "Tim", password: "password")
user2 = User.create(username: "Anna", password: "password")

post1 = Post.create!(title: "My First Post!",
  body: "Thoughts, etc.",
  author_id: user1.id,
  publish_date: Time.now - 5.days)
post2 = Post.create!(title: "Second Post!!",
  body: "More thoughts, etc.",
  author_id: user1.id,
  publish_date: Time.now)
post3 = Post.create!(title: "Hi",
  body: "I'm pretty friendly!",
  author_id: user2.id,
  publish_date: Time.now - 2.days)

Like.create!(user_id: user2.id, post_id: post1.id)
Like.create!(user_id: user2.id, post_id: post2.id)
