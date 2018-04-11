require 'spec_helper'

describe User do
  describe "#full_name" do
    it "should return the first and last names joined with a space" do
      test_user = FactoryGirl.create(:user)
      expected_full_name = "#{test_user.f_name} #{test_user.l_name}"
      expect(test_user.full_name).to eq expected_full_name
    end
  end
  
  describe "associations" do
    it { should have_many(:matches) }
    it { should have_many(:match_participations) }
  end
  
  
  context "when valid" do
    it "should be valid when given all attributes" do
      test_user = FactoryGirl.create(:user)
      expect(test_user).to be_valid
    end
  end
  
  context "when not valid" do
    it "should be invalid without a username" do
      bad_user = User.new()
      expect(bad_user).not_to be_valid
    end
    
    it "should require the username be at least 3 characters" do
      bad_user = User.new(username: "CJ")
      expect(bad_user).not_to be_valid
    end
    
  end

end
