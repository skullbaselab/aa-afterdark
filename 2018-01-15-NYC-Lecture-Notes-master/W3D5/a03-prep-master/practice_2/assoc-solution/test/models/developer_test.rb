# == Schema Information
#
# Table name: developers
#
#  id                :integer          not null, primary key
#  student_pod_id    :integer
#  student_circle_id :integer
#  name              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
