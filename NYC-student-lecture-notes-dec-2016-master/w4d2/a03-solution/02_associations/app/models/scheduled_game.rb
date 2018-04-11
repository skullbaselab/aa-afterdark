class ScheduledGame < ActiveRecord::Base
  belongs_to(
    :home_team,
    class_name: "Team",
    foreign_key: :home_team_id,
    primary_key: :id
  )

  belongs_to(
    :away_team,
    class_name: "Team",
    foreign_key: :away_team_id,
    primary_key: :id
  )
end
