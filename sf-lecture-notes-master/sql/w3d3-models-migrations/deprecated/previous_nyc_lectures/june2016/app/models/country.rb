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

# there are lots of fancy, shorter ways to write this
# you are NOT allowed to use them yet
  has_many(
    :citizens,
    class_name: "User",
    foreign_key: :country_id,
    primary_key: :id
  )
  # who are these strange citizens?
  # Oh, you just mean User
  # users has a foreign key of country_id

  # now I can write:
    # usa.citizens
    # and I will get back User objects

  # The association doesn't do anything to the database
  # There are not db level foreign key constraints

  has_many(
    :tweets,
    through: :citizens,
    source: :tweets
  )
end
