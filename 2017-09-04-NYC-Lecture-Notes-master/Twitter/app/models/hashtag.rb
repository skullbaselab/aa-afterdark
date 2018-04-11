# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  slogan     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashtag < ApplicationRecord
  has_many :hashtaggings,
    class_name: "Hashtagging",
    foreign_key: :hashtag_id,
    primary_key: :id

  has_many :tweets,
    through: :hashtaggings,
    source: :tweet
end
