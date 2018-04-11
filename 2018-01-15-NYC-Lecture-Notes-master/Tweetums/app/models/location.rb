# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord

  validates :name, presence: true

  has_many :users,
    class_name: 'User',
    foreign_key: :location_id,
    primary_key: :id

  has_many :tweets,
    through: :users,
    source: :tweets

  has_many :hash_tags,
    through: :tweets,
    source: :hash_tags
end
