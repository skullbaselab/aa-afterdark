# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string
#  location_id :integer
#

class User < ActiveRecord::Base
  belongs_to :location,
    class_name: 'Location',
    primary_key: :id,
    foreign_key: :location_id
  # user has foreign_key, so it holds the belongs_to association
  # belongs to is a method

  has_many :tweets,
    class_name: 'Tweet',
    primary_key: :id,
    foreign_key: :user_id
end
