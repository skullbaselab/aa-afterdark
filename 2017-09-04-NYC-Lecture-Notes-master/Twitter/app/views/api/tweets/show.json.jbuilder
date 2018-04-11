json.set! @tweet.id do
  json.partial! 'api/tweets/tweet', tweet: @tweet
end
