# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  belongs_to(
    :country,
    class_name: "Country",
    foreign_key: :country_id,
    primary_key: :id
  )

  has_many(
    :tweets,
    class_name: "Tweet",
    foreign_key: :author_id,
    primary_key: :id
  )
end
