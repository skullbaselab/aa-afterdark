require 'rails_helper'



RSpec.describe UserListing, type: :model do
  subject (:user_listing) { UserListing.create(user_id: 1, list_id: 1) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:list) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:list_id) }

  it { should belong_to(:user) }
  it { should belong_to(:list) }


end
