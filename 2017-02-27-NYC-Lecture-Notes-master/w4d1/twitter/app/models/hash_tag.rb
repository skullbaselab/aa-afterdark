# == Schema Information
#
# Table name: hash_tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class HashTag < ActiveRecord::Base
  has_many :hash_taggings,
    class_name: 'HashTagging',
    primary_key: :id,
    foreign_key: :hash_tag_id
end
