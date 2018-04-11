class Comment < ActiveRecord::Base
  belongs_to :parent_comment,
    class_name: 'Comment',
    primary_key: :id,
    foreign_key: :parent_comment_id

  has_many :child_comments,
    class_name: 'Comment',
    primary_key: :id,
    foreign_key: :parent_comment_id
end
