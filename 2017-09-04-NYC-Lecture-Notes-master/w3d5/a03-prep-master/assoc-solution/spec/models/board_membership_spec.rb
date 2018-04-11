require 'rails_helper'

RSpec.describe BoardMembership, type: :model do
subject(:membership) { BoardMembership.first }

  it "has a board" do
    goog_id = Company.find_by_name("Google").id
    expect(membership.board.company_id).to eq(goog_id)
  end

  it "has a member" do
    expect(membership.member.name).to eq("Larry Page")
  end

  describe "validations" do 
    it "require board membership to have a board" do
      is_expected.to validate_presence_of(:board).with_message(/must exist/)
    end

    it "require board membership to have a member" do
      is_expected.to validate_presence_of(:member).with_message(/must exist/)
    end
  end
end
