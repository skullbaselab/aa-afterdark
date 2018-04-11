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
  validates :name, presence: true

  has_many :citizens,
    class_name: "User",
    primary_key: :id,
    foreign_key: :location_id

  has_many :tweets,
    through: :citizens, #association/method you have written in this file
    source: :tweets #name of the association/method in the user(citizen) file


  #has_many is used when foreign_key exists in the other table/model
  #the only difference between has_many and has_one is that has_one
  #indicates there is only one, and only returns one object

end
