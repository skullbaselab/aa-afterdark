# == Schema Information
#
# Table name: teaching_assistant_memberships
#
#  id                    :integer          not null, primary key
#  teaching_assistant_id :integer          not null
#  pod_id                :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class TeachingAssistantMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
