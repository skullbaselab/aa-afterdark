class Recipe < ApplicationRecord
	validates :name,
	:author_id,
	:image_url,
	:ingredients,
	:description,
	:directions, presence: true

	has_many :reviews
end
