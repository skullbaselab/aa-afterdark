class Post < ActiveRecord::Base
  validates :author_id, :body, presence: true

  # First argument is name of method we are creating (could be anyting)
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: "User"

  has_many :comments,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Comment

  has_many :commenters,
    through: :comments,
    source: :commenter

  has_many :likes,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Like

  has_many :likers,
    through: :likes,
    source: :liker

end
