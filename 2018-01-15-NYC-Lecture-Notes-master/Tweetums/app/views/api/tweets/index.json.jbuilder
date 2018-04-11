# this says shape our data into an array and iterate over @tweets,
# turning them each into some kind of object
# json.array! @tweets  do |tweet|
#
#   json.extract! tweet, :id, :body
#
#   # same as above
#   # json.id tweet.id
#   # json.body tweet.body
# end
# json.order @tweets.pluck(:id)

# this object with tweets, will not be ordered
json.tweets do
  @tweets.each do |tweet|
    # dynamically make a key that is the id of the tweet
    json.set! tweet.id do
      json.partial! '/api/tweets/tweet', tweet: tweet
    end
  end
end

json.users do
  # this is not N+1 because we #includes author when we make tweets
  @tweets.map(&:author).each do |author|
    # dynamically make a key that is the id of the author
    json.set! author.id do
      # tweets index shouldn't know too much about user stuffs
      json.partial! '/api/users/user', user: author
    end
  end
end
