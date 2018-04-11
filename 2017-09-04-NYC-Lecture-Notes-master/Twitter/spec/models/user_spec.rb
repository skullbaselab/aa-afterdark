require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user,
      username: 'oscar',
      password: 'starwars'
    )
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:session_token) }
  it { should belong_to(:state) }
  it { should have_many(:tweets) }

  it "creates a session token before validation" do
    expect(user.session_token).not_to be_nil
  end

  describe "#reset_session_token!" do
    it "should change the session token" do
      old_token = user.session_token
      user.reset_session_token!
      oscar = User.find_by(username: 'oscar')
      # expect(user.session_token).not_to eq(old_token)
      expect(oscar.session_token).not_to eq(old_token)
    end

    it "should return the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "should return true for a good password" do
      expect(user.is_password?('starwars')).to be true
    end

    it "should return false for a bad password" do
      expect(user.is_password?('not_starwars')).to be false
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "should return a user if username and password match" do
      expect(User.find_by_credentials('oscar', 'starwars')).to eq(user)
    end

    it "should return nil if username and password don't match" do

    end
  end
end













# comment
