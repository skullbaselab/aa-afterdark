class Album < ActiveRecord::Base
	has_many :tracks, foreign_key: :album, primary_key: :asin
	has_many :styles, foreign_key: :album, primary_key: :asin
end
