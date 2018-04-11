# == Schema Information
#
# Table name: swords
#
#  id             :integer          not null, primary key
#  size           :integer
#  swordable_id   :integer          not null
#  swordable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Sword < ActiveRecord::Base
  validates :swordable_type, :swordable_id, presence: true
  validates :swordable_type, inclusion: { in: ['Samurai', 'Ninja'] }

  belongs_to :swordable, polymorphic: true
end
