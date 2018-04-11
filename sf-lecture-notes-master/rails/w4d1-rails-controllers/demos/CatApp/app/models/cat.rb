class Cat < ActiveRecord::Base
  validates :name, presence: true 
end
