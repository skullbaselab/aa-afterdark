# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  title      :string(255)      not null
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base
  validates :title, :body, :user, presence: true
  validates :body, length: { maximum: 140 }

  belongs_to :user
  has_many :replies
end
