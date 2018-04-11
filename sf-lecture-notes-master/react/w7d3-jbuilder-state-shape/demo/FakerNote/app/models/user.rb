class User < ApplicationRecord
	validates :username, :email, :image_url, presence: true

	has_many :notebooks, foreign_key: :author_id

	def notebook_count
		self.notebooks.count
	end
end
