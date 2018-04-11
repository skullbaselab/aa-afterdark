# == Schema Information
#
# Table name: lightsabers
#
#  id         :integer          not null, primary key
#  color      :string(255)      not null
#  jedi_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Lightsaber < ActiveRecord::Base
  COLORS = [:red, :blue, :green, :purple]

  validates :color, inclusion: { in: COLORS }

  belongs_to :owner, class_name: 'Jedi', foreign_key: :jedi_id
end
