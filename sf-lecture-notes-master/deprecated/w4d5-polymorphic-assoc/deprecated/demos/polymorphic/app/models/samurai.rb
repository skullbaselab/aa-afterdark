# == Schema Information
#
# Table name: samurais
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Samurai < ActiveRecord::Base
  include Swordable
  validates :name, presence: true
end
