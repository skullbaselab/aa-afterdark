class TodoComment < ActiveRecord::Base
  # Don't need in Rails 4
  # attr_accessible :todo_id, :content

  belongs_to :todo

  validates :todo, :content, :presence => true
end
