u1 = User.create!(username: "markov", password: "majestic")
u2 = User.create!(username: "curie", password: "password")
u3 = User.create!(username: "breakfast", password: "password")
u4 = User.create!(username: "earl", password: "password")
u5 = User.create!(username: "sally", password: "password")

users = [u1, u2, u3, u4, u5]

[0, 1, 4, 5, 6, 9].each do |i|
  photo = Photo.create!(photo_url: "http://placekitten.com/452/450?image=#{i}")
  users.sample(rand(users.length)).each do |user|
    photo.likes.create!(user_id: user.id)
  end
end
