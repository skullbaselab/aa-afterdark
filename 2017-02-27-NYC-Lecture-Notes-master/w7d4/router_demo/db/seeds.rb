Tweet.destroy_all
10.times do
  content = [
    Faker::Hacker.say_something_smart,
    Faker::ChuckNorris.fact,
    Faker::Hipster.sentence
  ]
  Tweet.create!(content: content.sample)
end
