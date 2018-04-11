# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base
  validates :body, presence: true

  belongs_to :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  has_many :hash_taggings,
    class_name: 'HashTagging',
    primary_key: :id,
    foreign_key: :tweet_id

  has_many :hash_tags,
    through: :hash_taggings,
    source: :hash_tag
  # this through association relies on direct associtions
  # it should go after the direct associations
end
