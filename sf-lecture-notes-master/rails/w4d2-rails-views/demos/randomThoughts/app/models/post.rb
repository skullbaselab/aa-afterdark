class Post < ApplicationRecord
  validates :title, :author_id, :publish_date, presence: true
  validate :no_future_posts

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :likes,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Like

  has_many :likers,
    through: :likes,
    source: :user

  private

  def no_future_posts
    if self.publish_date > Time.now.to_date
      self.errors.add(:publish_date, "can't be in the future")
    end
  end
end
