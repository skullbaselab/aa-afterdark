# json.id post.id
# json.title post.title
# json.body post.body
# json.like_count post.like_count

json.extract! post, :id, :title, :body, :like_count, :dummy_method
# do the symbols have to match a attribute in the object?
# nope, has to match with a *method* the object has

# json.comments post.comments do |comment|
#   json.id comment.id
#   json.body comment.body
# end

# json.comments post.comments, :id, :body

# json.comments do
#   json.array! post.comments do |comment|
#     # json.id comment.id
#     # json.body comment.body
#     # json.extract! comment, :id, :body
#   end
#
# end
# json.comments do
#   json.array! post.comments, partial: 'api/comments/comment', as: :comment
# end

json.comments post.comments, partial: 'api/comments/comment', as: :comment
