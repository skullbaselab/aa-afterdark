require 'rails_helper'

begin
  Tweet
rescue
  Tweet = nil
end

RSpec.describe Tweet, :type => :model do
  it { should validate_length_of(:body) }
  it { should have_many(:replies) }
end
