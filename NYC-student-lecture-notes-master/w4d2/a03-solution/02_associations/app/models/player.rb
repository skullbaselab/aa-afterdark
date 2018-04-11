class Player < ActiveRecord::Base
  belongs_to(
    :team,
    class_name: "Team",
    foreign_key: :team_id,
    primary_key: :id
  )

  has_many(
    :jerseys,
    class_name: "Jersey",
    foreign_key: :player_id,
    primary_key: :id
  )

  has_many(
    :follows,
    class_name: "Follow",
    foreign_key: :player_id,
    primary_key: :id
  )

  has_many(
    :followers,
    through: :follows,
    source: :fan
  )

  has_one(
    :captain,
    through: :team,
    source: :captain
  )
end
