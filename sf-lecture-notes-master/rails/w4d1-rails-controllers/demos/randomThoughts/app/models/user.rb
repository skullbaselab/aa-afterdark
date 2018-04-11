class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :authored_posts,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Post

  has_many :likes

  has_many :liked_posts,
    through: :likes,
    source: :post
end