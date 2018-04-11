# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Tweet.destroy_all
Comment.destroy_all

alex = User.create!(username: "alex", password: 'starwars')
moe = User.create!(username: "moe", password: 'starwars')
matthias = User.create!(username: "matthias", password: 'starwars')
mike = User.create!(username: "mike", password: 'starwars')
david = User.create!(username: "david", password: 'starwars')
oscar = User.create!(username: "oscar", password: 'starwars')
ommi = User.create!(username: "ommi", password: 'starwars')
mashu = User.create!(username: "mashu", password: 'starwars')

def nth_tweet(n)
  Tweet.offset(n - 1).limit(1).first
end

tweets = Tweet.create!(
  [
    {
      body: "Elm is the best programming language",
      author: alex
    },
    {
      body: "I am dying and need Emergen-C!",
      author: moe
    },
    {
      body: "The true struggle is for the superiority of ideas",
      author: matthias
    },
    {
      body: "Say what's up to the WolveMan!",
      author: mike
    },
    {
      body: "Have you ever seen Bruce Wayne and Batman in the same place 😤",
      author: david
    },
    {
      body: "What's everybody's favorite dipthong?",
      author: oscar
    },
    {
      body: "D&D is the life for me",
      author: ommi
    },
    {
      body: "What's new on the internet",
      author: mashu
    }
  ]
)

comments = Comment.create(
  [
    {
      body: "You are such a nerd",
      author: User.all.sample,
      tweet: nth_tweet(1)
    },
    {
      body: "All hail Brendan Eich",
      author: User.all.sample,
      tweet: nth_tweet(1)
    },
    {
      body: "Why don't you just go home, dummy?",
      author: User.all.sample,
      tweet: nth_tweet(2)
    },
    {
      body: "I see you Moira!",
      author: User.all.sample,
      tweet: nth_tweet(3)
    },
    {
      body: "You are OP!",
      author: User.all.sample,
      tweet: nth_tweet(3)
    },
    {
      body: "Love that dude!",
      author: User.all.sample,
      tweet: nth_tweet(4)
    },
    {
      body: "🤔🤔🤔🤔🤔🤔🤔",
      author: User.all.sample,
      tweet: nth_tweet(5)
    },
    {
      body: "STOP SNITCHING",
      author: User.all.sample,
      tweet: nth_tweet(5)
    },
    {
      body: "Aussie Aussie Aussie. OI OI OI",
      author: User.all.sample,
      tweet: nth_tweet(6)
    },
    {
      body: "Definitely would have to say I don't know what a dipthong is",
      author: User.all.sample,
      tweet: nth_tweet(6)
    },
    {
      body: "Preach!",
      author: User.all.sample,
      tweet: nth_tweet(7)
    },
    {
      body: "Have you seen that chicken singing despacito?",
      author: User.all.sample,
      tweet: nth_tweet(8)
    }
  ]
)
