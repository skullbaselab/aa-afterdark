class Movie < ActiveRecord::Base
	has_many :castings
	has_many :actors, through: :castings
end
