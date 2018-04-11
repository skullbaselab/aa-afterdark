# == Schema Information
#
# Table name: hashtaggings
#
#  id         :integer          not null, primary key
#  tweet_id   :integer          not null
#  hashtag_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashtagging < ApplicationRecord
  belongs_to :tweet,
    foreign_key: :tweet_id,
    class_name: "Tweet",
    primary_key: :id

  belongs_to :hashtag,
    foreign_key: :hashtag_id,
    class_name: "Hashtag",
    primary_key: :id 
end
