class Stadium < ActiveRecord::Base
  belongs_to(
    :team,
    class_name: "Team",
    foreign_key: :team_id,
    primary_key: :id
  )

  has_many(
    :seats,
    class_name: "Seat",
    foreign_key: :stadium_id,
    primary_key: :id
  )

  has_many(
    :games,
    through: :team,
    source: :home_games
  )
end
