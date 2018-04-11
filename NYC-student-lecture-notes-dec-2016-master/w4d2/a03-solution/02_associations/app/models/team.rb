class Team < ActiveRecord::Base
  has_many(
    :players,
    class_name: "Player",
    foreign_key: :team_id,
    primary_key: :id
  )

  has_many(
    :fans,
    class_name: "Fan",
    foreign_key: :favorite_team_id,
    primary_key: :id
  )

  has_one(
    :stadium,
    class_name: "Stadium",
    foreign_key: :team_id,
    primary_key: :id
  )

  belongs_to(
    :captain,
    class_name: "Player",
    foreign_key: :captain_id, 
    primary_key: :id
  )

  has_many(
    :home_games,
    class_name: "ScheduledGame",
    foreign_key: :home_team_id,
    primary_key: :id
  )

  has_many(
    :away_games,
    class_name: "ScheduledGame",
    foreign_key: :away_team_id,
    primary_key: :id
  )

  has_many(
    :home_opponents,
    through: :home_games,
    source: :away_team
  )

  has_many(
    :away_opponents,
    through: :away_games,
    source: :home_team
  )
end
