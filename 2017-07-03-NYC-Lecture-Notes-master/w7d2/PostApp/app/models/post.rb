# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like_count :integer
#

class Post < ActiveRecord::Base
  validates :title, :body, presence: true
end
