class Style < ActiveRecord::Base
	belongs_to :album, foreign_key: :album, primary_key: :asin
end
