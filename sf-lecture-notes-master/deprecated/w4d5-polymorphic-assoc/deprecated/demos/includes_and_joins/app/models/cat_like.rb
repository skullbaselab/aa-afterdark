# == Schema Information
#
# Table name: cat_likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  cat_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :cat
end
