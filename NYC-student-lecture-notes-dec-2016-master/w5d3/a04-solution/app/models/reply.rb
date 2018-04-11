class Reply < ActiveRecord::Base
  validates :body, :tweet, presence: true
  validates :body, length: { maximum: 140 }

  belongs_to :tweet
end
