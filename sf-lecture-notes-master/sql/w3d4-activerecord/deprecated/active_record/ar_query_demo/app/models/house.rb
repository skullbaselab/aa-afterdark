class House < ActiveRecord::Base
  has_many :people
  has_many :cats, through: :people, source: :cats
end
