# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ApplicationRecord
  validates :body, :author_id, presence: true
  validates :body, length: { maximum: 5000, minimum: 1 }

  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id

  has_many :hashtaggings,
    class_name: "Hashtagging",
    foreign_key: :tweet_id,
    primary_key: :id

  has_many :hashtags,
    through: :hashtaggings,
    source: :hashtag

end
