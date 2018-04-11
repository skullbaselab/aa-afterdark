class Tweet < ApplicationRecord
  # validate presence of author, not author_id to make sure author exists
  validates :body, :author, presence: true

  # in rails 5, belongs_to will automatically validate presence of
  belongs_to :author,
  class_name: 'User',
  foreign_key: :author_id,
  primary_key: :id

  has_many :comments,
  class_name: 'Comment',
  foreign_key: :tweet_id,
  primary_key: :id

end
