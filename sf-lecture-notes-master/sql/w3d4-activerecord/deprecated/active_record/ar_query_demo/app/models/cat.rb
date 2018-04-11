class Cat < ActiveRecord::Base
  belongs_to :person
  has_one :house, through: :person, source: :house
end
