# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ApplicationRecord
  validates :body, presence: true
  #
  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  
  has_many :hash_taggings,
    class_name: 'HashTagging',
    foreign_key: :tweet_id,
    primary_key: :id
  
  has_many :hash_tags,
    through: :hash_taggings,
    source: :hash_tag

end
