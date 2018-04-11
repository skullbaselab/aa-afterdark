class Comment < ApplicationRecord
  belongs_to :tweet,
  class_name: 'Tweet',
  foreign_key: :tweet_id,
  primary_key: :id

  belongs_to :author,
  class_name: 'User',
  foreign_key: :author_id,
  primary_key: :id

  # can't use belongs_to here b/c the foreign key is in another table
  has_one :author_of_tweet,
  through: :tweet,
  source: :author

end
