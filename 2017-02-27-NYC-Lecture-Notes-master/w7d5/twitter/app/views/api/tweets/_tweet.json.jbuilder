json.extract! tweet, :id, :content
json.author do
  json.extract! tweet.user, :id, :username
end
