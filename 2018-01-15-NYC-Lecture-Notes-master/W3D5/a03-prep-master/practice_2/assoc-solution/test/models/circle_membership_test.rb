# == Schema Information
#
# Table name: circle_memberships
#
#  id         :integer          not null, primary key
#  circle_id  :integer          not null
#  student_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CircleMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
