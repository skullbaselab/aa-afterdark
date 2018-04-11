class Seat < ActiveRecord::Base
  belongs_to(
    :owner,
    class_name: "Fan",
    foreign_key: :owner_id,
    primary_key: :id
  )

  belongs_to(
    :stadium,
    class_name: "Stadium",
    foreign_key: :stadium_id,
    primary_key: :id
  )
end
