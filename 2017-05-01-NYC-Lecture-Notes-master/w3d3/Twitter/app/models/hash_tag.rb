# == Schema Information
#
# Table name: hash_tags
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class HashTag < ActiveRecord::Base

  has_many :hash_taggings,
    class_name: :HashTagging,
    primary_key: :id,
    foreign_key: :hash_tag_id

  has_many :tweets,
    through: :hash_taggings,
    source: :tweet

  
end
