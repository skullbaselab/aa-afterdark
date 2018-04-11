class List < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :user_listings
  has_many :users,
    through: :user_listings

end
