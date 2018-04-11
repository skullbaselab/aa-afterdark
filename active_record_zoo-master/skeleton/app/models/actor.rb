class Actor < ActiveRecord::Base
	has_many :castings
	has_many :movies, through: :castings

end
