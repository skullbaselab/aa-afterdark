# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class State < ApplicationRecord
  validates :name, presence: true

  has_many :users,
    class_name: "User",
    foreign_key: :state_id,
    primary_key: :id

# through association below
# through uses joins
# THE THROUGH: an association within this class
# THE SOURCE: an association in source class (gotten from
                                            # association within this class)
  has_many :tweets,
    through: :users,
    source: :tweets


end
