# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  building   :string(255)
#  master_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class House < ActiveRecord::Base
  belongs_to(
    :master,
    :class_name => 'Wizard',
    :foreign_key => :master_id,
    :primary_key => :id
  )
  has_many(
    :students,
    :class_name => 'Wizard',
    :foreign_key => :house_id,
    :primary_key => :id
  )
  has_one(
    :school,
    :through => :master,
    :source => :school
  )
end

