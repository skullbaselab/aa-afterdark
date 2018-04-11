require 'rails_helper'

RSpec.describe Cat, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should belong_to(:owner) }
  it { should have_many(:rental_requests) }


end
