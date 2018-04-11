# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  username    :string           not null
#  location_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime

class User < ActiveRecord::Base
  validates :location_id, presence: true
  
  has_many :tweets,
    class_name: :Tweet,
    primary_key: :id,
    foreign_key: :author_id

  belongs_to :location,
    class_name: :Location,
    primary_key: :id,
    foreign_key: :location_id

  has_many :hash_tags,
    through: :tweets,
    source: :hash_tags

end
