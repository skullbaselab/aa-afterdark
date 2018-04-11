# == Schema Information
#
# Table name: jedis
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  darkside   :boolean          default(FALSE), not null
#  master     :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Jedi < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  [:master, :darkside].each do |attr|
    validates attr, inclusion: { in: [true, false] }
  end

  has_one :lightsaber

  JEDI_POWERS = {
    normal: [:mind_control, :force_jump],
    master: [:force_absorb]
  }
  SITH_POWERS = {
    normal: [:force_crush, :force_push],
    master: [:force_lightning]
  }

  def self.sith_amongst_us
    self.where(darkside: true)
  end

  def powers
    powers = self.darkside? ? SITH_POWERS : JEDI_POWERS
    self.master? ? powers[:normal] + powers[:master] : powers[:normal]
  end
end
