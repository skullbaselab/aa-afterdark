json.array! @tweets do |tweet|
  json.id tweet.id
  json.body tweet.body
  json.authorName tweet.author.username
end
