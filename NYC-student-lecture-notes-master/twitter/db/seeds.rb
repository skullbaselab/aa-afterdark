User.destroy_all

users = []

while users.length < 10 do
  user = User.create(
    username: Faker::Pokemon.name,
    password: 'starwars'
  )
  users << user if user.persisted?
end

Tweet.destroy_all
10.times do
  content = [
    Faker::Hacker.say_something_smart,
    Faker::ChuckNorris.fact,
    Faker::Hipster.sentence
  ]
  Tweet.create!(content: content.sample, author: users.sample)
end

Tweet.create!(content: 'https://www.youtube.com/watch?v=XLlnua63s0s', author: users.sample)
