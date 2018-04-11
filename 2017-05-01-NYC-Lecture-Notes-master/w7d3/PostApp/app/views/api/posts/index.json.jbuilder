# THIS IS RUBY!
# we can use byebug
# we can use if/else

# Why use JBuilder?
# It makes sense to customize the data we send back in our responses
# Optimization, security, data cleanliness

# json.array! [1, 2, 3] do |num|
#   json.the_number_is(num)
# end

json.array! @posts do |post|

  json.partial! 'api/posts/post', post: post

  # # json.id post.id
  # # json.title post.title
  # # json.body post.body
  # # json.like_count post.like_count
  #
  # json.extract! post, :id, :title, :body, :like_count, :dummy_method
  # # do the symbols have to match a attribute in the object?
  # # nope, has to match with a *method* the object has
  #
  # # json.comments post.comments do |comment|
  # #   json.id comment.id
  # #   json.body comment.body
  # # end
  #
  # # json.comments post.comments, :id, :body
  #
  # json.comments do
  #   json.array! post.comments do |comment|
  #     # json.id comment.id
  #     # json.body comment.body
  #     json.extract! comment, :id, :body
  #   end
  # end


end
