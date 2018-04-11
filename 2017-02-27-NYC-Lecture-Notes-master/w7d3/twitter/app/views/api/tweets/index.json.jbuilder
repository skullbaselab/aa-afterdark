# json.array! @tweets do |tweet|
#   json.partial! 'tweet', tweet: tweet
# end

# json.array! collection, partial: 'partial_string', as: :what_do_we_call_the_var_in_the_partial

# json.tweets do
#  json.array! @tweets, partial: 'tweet', as: :tweet
# end

json.tweets @tweets, partial: 'tweet', as: :tweet

json.tags HashTag.pluck(:name)
