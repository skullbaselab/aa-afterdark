class Demo < ApplicationRecord
  validates :name, :price, presence: true
end
