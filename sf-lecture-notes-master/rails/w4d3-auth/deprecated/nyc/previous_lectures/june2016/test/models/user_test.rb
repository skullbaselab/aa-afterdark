# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  country_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#  session_token   :string           not null
#  password_digest :string           not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
