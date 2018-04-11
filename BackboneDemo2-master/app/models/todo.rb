class Todo < ActiveRecord::Base
  # Don't need in Rails 4
  # attr_accessible :title

  has_many(
    :comments,
    :class_name => "TodoComment"
  )

  validates :title, :presence => true
end
