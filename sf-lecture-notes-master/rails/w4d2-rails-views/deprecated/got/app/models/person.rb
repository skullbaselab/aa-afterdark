class Person < ActiveRecord::Base
  validates :name, :picture_url, presence: true
  validates :alive, inclusion: [true, false]
end
