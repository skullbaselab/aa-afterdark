require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of :username } 
  it { should validate_presence_of :password_digest }
  it { should validate_presence_of :session_token }
  it { should validate_length_of(:password).is_at_least(6) }
  # uniqueness validations need to be compared against something existing in the db already
  # it { should validate_uniqueness_of :username }
  # it { should validate_uniqueness_of :session_token }
  it { should have_many(:tweets).class_name(Tweet) }
  it { should belong_to(:location).class_name(Location) }
  
  describe "uniqueness" do
    before :each do 
      create(:user, location_id: Location.create(name: 'miami').id)
    end
    it { should validate_uniqueness_of (:username) } 
    it { should validate_uniqueness_of (:session_token) }
  end
  
end