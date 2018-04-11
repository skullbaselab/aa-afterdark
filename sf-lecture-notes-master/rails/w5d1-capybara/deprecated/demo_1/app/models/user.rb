class User < ActiveRecord::Base
  validates :username, length: { minimum: 3 }, uniqueness: true
  
  def full_name
    "#{f_name} #{l_name}"
  end
  
  has_many :match_participations, 
           :class_name => "MatchParticipation", :foreign_key => "user_id"
           
  has_many :matches, 
           :through => :match_participation, 
           :source => :match
end
