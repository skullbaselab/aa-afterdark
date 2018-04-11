class Dept < ActiveRecord::Base
	has_many :teachers
end
