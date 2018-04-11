class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :posts,
    class_name: "Post",
    primary_key: :id,
    foreign_key: :author_id

  has_many :comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :commenter_id

  has_many :commented_posts,
    through: :comments,
    source: :post

  has_many :likes,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :Like

  has_many :liked_posts,
    through: :likes,
    source: :post

end
