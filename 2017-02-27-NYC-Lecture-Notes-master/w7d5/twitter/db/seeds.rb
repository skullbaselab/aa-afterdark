Tweet.destroy_all
User.destroy_all
User.create!(username: "Patrick", password: "starwars")
5.times do
  User.create!(username: Faker::GameOfThrones.character, password: "starwars")
end

user_ids = User.pluck(:id)
10.times do
  content = [
    Faker::Hacker.say_something_smart,
    Faker::ChuckNorris.fact,
    Faker::Hipster.sentence
  ]
  Tweet.create!(content: content.sample, user_id: user_ids.sample)
end
