class Photo < ActiveRecord::Base
  validates :photo_url, presence: true

  has_many :likes, counter_cache: true
  has_many :likers, through: :likes, source: :user

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
