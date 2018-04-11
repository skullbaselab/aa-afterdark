
###########
#  Users  #
###########

print "☠️  Destroying users... "
User.destroy_all
puts "✅"

print "📝  Seeding users... "
tommy = User.create!(username: 'tommypickles', country: 'Argentina', password: 'starwars')
oscar = User.create!(username: 'oscarmayer', country: 'USA', password: 'starwars')
moe = User.create!(username: 'momofuku', country: 'Jersey', password: 'starwars')
patrick = User.create!(username: 'pattycake', country: 'USA', password: 'starwars')
danny = User.create!(username: 'dannycat', country: 'USA', password: 'starwars')
ali = User.create!(username: 'alicat', country: 'USA', password: 'starwars')
mike = User.create!(username: 'mbone', country: 'Jersey', password: 'starwars')
meag = User.create!(username: 'meagazord', country: 'California', password: 'starwars')
matt = User.create!(username: 'mattlepuff', country: 'USA', password: 'starwars')
julian = User.create!(username: 'badjuju', country: 'USA', password: 'starwars')
al = User.create!(username: 'vegetal', country: 'USA', password: 'starwars')
puts "✅"

users = [tommy, oscar, moe, patrick, danny, ali, mike, meag, matt, julian, al]

############
#  Tweets  #
############

print "☠️  Destroying tweets... "
Tweet.destroy_all
puts "✅"

print "📝  Seeding tweets... "
5.times do
  users.each do |user|
    tweet = Tweet.new(author_id: user.id)

    while tweet.body.nil? || Tweet.where(body: tweet.body).exists?
      case rand(6)
      when 0
        tweet.body = Faker::HitchhikersGuideToTheGalaxy.marvin_quote
      when 1
        tweet.body = Faker::Matz.quote
      when 2
        tweet.body = Faker::HeyArnold.quote
      when 3
        tweet.body = Faker::HarryPotter.quote
      when 4
        tweet.body = Faker::StarWars.quote
      when 5
        tweet.body = Faker::Hacker.say_something_smart
      end
    end

    tweet.save!
  end
end
puts "✅"


###########
#  Lists  #
###########

print "☠️  Destroying lists... "
List.destroy_all
puts "✅"

print "📝  Seeding lists... "

aa_nyc = List.create!(title: 'App Academy NYC')
brooklyn = List.create!(title: 'Brooklyn')
manhattan = List.create!(title: 'Manhattan')
placements = List.create!(title: 'Placements')

aa_nyc.users = users
aa_nyc.save

brooklyn.users = [moe, meag, mike, matt]
brooklyn.save

manhattan.users = [oscar, al, ali, julian]
manhattan.save

placements.users = [patrick, danny, matt]
placements.save

puts "✅"
