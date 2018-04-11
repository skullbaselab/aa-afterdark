class Follow < ActiveRecord::Base
  belongs_to(
    :fan,
    class_name: "Fan",
    foreign_key: :fan_id,
    primary_key: :id
  )

  belongs_to(
    :player,
    class_name: "Player",
    foreign_key: :player_id,
    primary_key: :id
  )
end
