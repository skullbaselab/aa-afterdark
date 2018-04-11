json.extract! tweet, :id, :body
json.author do
  json.extract! tweet.user, :id, :name
end

json.tags tweet.hash_tags.map(&:name)
