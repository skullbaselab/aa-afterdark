# fill me in!
json.tweets do
  @tweets.each do |tweet|
    json.set! tweet.id do
      # json.extract! tweet, :body, :author_id
      json.partial! "api/tweets/tweet", tweet: tweet
    end
  end
end
