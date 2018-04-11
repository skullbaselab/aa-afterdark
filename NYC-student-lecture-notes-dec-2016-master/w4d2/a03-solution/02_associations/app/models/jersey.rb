class Jersey < ActiveRecord::Base
  belongs_to(
    :player,
    class_name: "Player",
    foreign_key: :player_id,
    primary_key: :id
  )
end
