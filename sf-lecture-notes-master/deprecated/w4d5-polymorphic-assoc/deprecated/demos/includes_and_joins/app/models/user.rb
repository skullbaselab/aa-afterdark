# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :cats, foreign_key: :owner_id
  has_many :cat_likes
  has_many :liked_cats, through: :cat_likes, source: :cat
end
