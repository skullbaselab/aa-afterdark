

# json.tweets do
  @tweets.each do |tweet|
    # set! dynamically creates keys with the variable we pass it
    json.set! tweet.id do
      # use full path for partial because we might use partials in other directories
      # (ex- we might want to include tweet comments)
      json.partial! 'api/tweets/tweet', tweet: tweet # this partial is doing the below for us
      json.commentIds tweet.comment_ids
      # json.extract! tweet, :id, :body
      # json.authorName tweet.author.username
    end
  end
# end


# json.array! @tweets do |tweet|
    # json.extract! tweet, :id, :body
#   # below is fancy way for above
#   # json.(tweet, :id, :body)

    # below done by extract!
#   # json.id tweet.id
#   # json.body tweet.body
#
#   # can't use extract! for below because no authorName method exists on tweet
#   json.authorName tweet.author.username
# end
