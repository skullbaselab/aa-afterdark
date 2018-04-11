json.extract! user, :username, :id
json.tweetIds user.tweets.map(&:id)
