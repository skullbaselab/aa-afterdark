@tweets.each do |tweet|
  json.set! tweet.id do
    json.extract! tweet, :body, :id
  end
end
