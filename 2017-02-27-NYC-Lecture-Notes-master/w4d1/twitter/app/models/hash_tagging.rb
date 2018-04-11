# == Schema Information
#
# Table name: hash_taggings
#
#  id          :integer          not null, primary key
#  tweet_id    :integer
#  hash_tag_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class HashTagging < ActiveRecord::Base
  belongs_to :hash_tag,
    class_name: 'HashTag',
    primary_key: :id,
    foreign_key: :hash_tag_id

  belongs_to :tweet,
    class_name: 'Tweet',
    primary_key: :id,
    foreign_key: :tweet_id
end
