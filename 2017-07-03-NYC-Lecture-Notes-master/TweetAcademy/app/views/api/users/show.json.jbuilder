json.user do
  json.partial! 'user', user: @user
end

json.tweets do
  json.array! @user.tweets.reverse, partial: 'api/tweets/tweet', as: :tweet
end

json.lists do
  json.array! @user.lists, partial: 'api/lists/list', as: :list
end
