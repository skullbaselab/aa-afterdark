require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:author) }
  it { should belong_to(:author) }
  it { should have_many(:comments) }
end
