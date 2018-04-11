json.index do
  @tweets.each do |tweet|
    json.set! tweet.id do
      json.partial! 'tweet', tweet: tweet
    end
  end
end

json.ord @tweets.map(&:id)
