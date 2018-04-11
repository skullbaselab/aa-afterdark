# == Schema Information
#
# Table name: ninjas
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ninja < ActiveRecord::Base
  include Swordable
end
