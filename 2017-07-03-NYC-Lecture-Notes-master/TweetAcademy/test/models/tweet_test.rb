# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string           not null
#

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
