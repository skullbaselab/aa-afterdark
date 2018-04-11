class Article < ActiveRecord::Base
  validates :title, :body, presence: true
  has_many :comments
end
