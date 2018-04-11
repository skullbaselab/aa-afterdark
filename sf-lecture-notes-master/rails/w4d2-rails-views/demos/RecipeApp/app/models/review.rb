class Review < ApplicationRecord
	validates :user_id, uniqueness: { scope: :recipe_id }, presence: true
	validates :recipe_id, :body, presence: true

	belongs_to :user
	belongs_to :recipe
end
