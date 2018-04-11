class Todo < ActiveRecord::Base
  attr_accessible :title

  has_many :comments, :class_name => "TodoComment"

  validates :title, :presence => true
end
