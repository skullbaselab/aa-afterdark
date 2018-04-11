# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  created_at :datetime
#  updated_at :datetime
#  author_id  :integer          not null
#

class Tweet < ActiveRecord::Base
  validates :body, :author_id, presence: true

  # can use either a symbol or string for class name
  belongs_to(:author,
    {class_name: :User,
    primary_key: :id,
    foreign_key: :author_id})

  has_one :location,
    through: :author,
    source: :location

  has_many :hash_taggings,
    class_name: :HashTagging,
    primary_key: :id,
    foreign_key: :tweet_id

  has_many :hash_tags,
    through: :hash_taggings,
    source: :hash_tag


end
