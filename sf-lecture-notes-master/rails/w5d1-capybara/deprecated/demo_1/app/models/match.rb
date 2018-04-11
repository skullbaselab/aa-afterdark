class Match < ActiveRecord::Base
  has_many :match_participations, 
           :class_name => "match_participation", 
           :foreign_key => "match_id"
end
