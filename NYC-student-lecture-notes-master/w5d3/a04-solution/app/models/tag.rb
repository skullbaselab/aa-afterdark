# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  belongs_to :post
  validates :post, :name, presence: true 
end
