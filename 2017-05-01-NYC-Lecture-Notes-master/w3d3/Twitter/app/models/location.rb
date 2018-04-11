# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
  has_many :users,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :location_id
end
