# == Schema Information
#
# Table name: wands
#
#  id              :integer          not null, primary key
#  core_ingredient :string(255)
#  owner_id        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Wand < ActiveRecord::Base
  belongs_to(
    :owner,
    :class_name => 'Wizard',
    :foreign_key => :owner_id,
    :primary_key => :id
  )
end
