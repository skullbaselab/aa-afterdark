# == Schema Information
#
# Table name: schools
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  headmaster_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class School < ActiveRecord::Base
  belongs_to(
    :headmaster,
    :class_name => 'Wizard',
    :foreign_key => :headmaster_id,
    :primary_key => :id
  )
  has_many(
    :residents,
    :class_name => 'Wizard',
    :foreign_key => :school_id,
    :primary_key => :id
  )
end
