class Cat < ActiveRecord::Base
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id
  )

  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    dependent: :destroy
  )

  validates(
    :name,
    :user_id,
    presence: true
  )
end
