class Subscription < ActiveRecord::Base
  belongs_to :subscriber,
    foreign_key: :subscriber_id,
    class_name: 'User',
    inverse_of: :subscriptions

  belongs_to :feed

  validates :subscriber_id, presence: true
  validates :feed_id, presence: true

end
