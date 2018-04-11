# == Schema Information
#
# Table name: hash_taggings
#
#  id          :integer          not null, primary key
#  tweet_id    :integer          not null
#  hash_tag_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HashTagging < ApplicationRecord

  belongs_to :hash_tag,
    class_name: 'HashTag',
    foreign_key: :hash_tag_id,
    primary_key: :id

  belongs_to :tweet,
    class_name: 'Tweet',
    foreign_key: :tweet_id,
    primary_key: :id

end
