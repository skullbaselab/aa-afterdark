json.extract! tweet, :id, :body, :author_id
json.created_at time_ago_in_words(tweet.created_at)
