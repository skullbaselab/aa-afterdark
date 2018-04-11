class Like < ActiveRecord::Base

  validates :liker_id, :post_id, presence: true

  belongs_to :liker,
    primary_key: :id,
    class_name: :User,
    foreign_key: :liker_id

  belongs_to :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post



end
