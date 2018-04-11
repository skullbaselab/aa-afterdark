require 'rails_helper'

begin
  Reply
rescue
  Reply = nil
end

RSpec.describe Reply, :type => :model do
  it { should validate_length_of(:body) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:tweet) }
  it { should validate_presence_of(:tweet) }
end
