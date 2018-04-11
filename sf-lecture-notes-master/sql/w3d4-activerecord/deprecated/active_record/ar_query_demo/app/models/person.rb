class Person < ActiveRecord::Base
  belongs_to :house
  has_many :cats
end
