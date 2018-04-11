# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ActiveRecord::Base
  validates(:name, { presence: true, uniqueness: true })

  has_many(
    :citizens,
    class_name: "User",
    foreign_key: :country_id,
    primary_key: :id
  )

  has_many(
    :tweets,
    through: :citizens,
    source: :tweets
  )
end
