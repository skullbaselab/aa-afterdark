class Fan < ActiveRecord::Base
  belongs_to(
    :favorite_team,
    class_name: "Team",
    foreign_key: :favorite_team_id,
    primary_key: :id
  )

  has_many(
    :follows,
    class_name: "Follow",
    foreign_key: :fan_id,
    primary_key: :id
  )

  has_many(
    :seats,
    class_name: "Seat",
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_many(
    :followed_players,
    through: :follows,
    source: :player
  )
end
