# == Schema Information
#
# Table name: hash_tags
#
#  id         :integer          not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HashTag < ApplicationRecord
  
  has_many :hash_taggings,
    class_name: 'HashTagging',
    foreign_key: :hash_tag_id,
    primary_key: :id
end
