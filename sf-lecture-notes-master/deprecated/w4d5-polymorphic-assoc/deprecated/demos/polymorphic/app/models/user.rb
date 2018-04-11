class User < ActiveRecord::Base
  has_many :subscriptions,
    foreign_key: :subscriber_id

  has_many :feeds,
    through: :subscriptions,
    source: :feed

  validates :feeds, presence: true
end
