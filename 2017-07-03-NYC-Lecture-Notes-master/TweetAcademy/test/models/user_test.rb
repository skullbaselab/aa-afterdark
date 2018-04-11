# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  country         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#  password_digest :string           not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
