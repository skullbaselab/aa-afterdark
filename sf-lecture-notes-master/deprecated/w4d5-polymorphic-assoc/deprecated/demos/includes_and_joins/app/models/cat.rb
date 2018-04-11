# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  name       :string
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cat < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :cat_likes
  has_many :user_likes, through: :cat_likes, source: :user
end
