# == Schema Information
#
# Table name: locations
#
#  id   :integer          not null, primary key
#  name :string
#

class Location < ActiveRecord::Base
  has_many(:users,
      {
        class_name: 'User',
        primary_key: :id,
        foreign_key: :location_id
      }
    )

  has_many :tweets,
    through: :users,
    source: :authored_tweets
end
