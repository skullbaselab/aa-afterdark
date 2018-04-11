require 'spec_helper'

describe User do
  it "should be valid with a 3+ char username" do
    testuser = FactoryGirl.build(:user)
    puts testuser.username
    expect(testuser).to be_valid
  end
  
  it "has a username of at least 3 char.s" do
    testuser = FactoryGirl.build(:user, username: "CJ")
    puts testuser.username
    expect(testuser).not_to be_valid
  end
  
  it "has a full name that is the first and last name" do
    testuser = FactoryGirl.build(:user)
    puts testuser.full_name
    expected_full_name = "#{testuser.f_name} #{testuser.l_name}"
    expect(testuser.full_name).to eq expected_full_name
  end


  describe "associations" do
    it { should have_many :match_participations }
    it { should have_many :matches }
  end
  
end
