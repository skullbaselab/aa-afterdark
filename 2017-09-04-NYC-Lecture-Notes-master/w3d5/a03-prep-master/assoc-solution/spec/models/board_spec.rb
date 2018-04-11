require 'rails_helper'

RSpec.describe Board, type: :model do
  subject(:board) { Board.first }

  it "has a company " do
    expect(board.company.name).to eq("Google")
  end

  it "has a membership" do
    larry_id = Executive.find_by_name("Larry Page").id
    expect(board.memberships.first.board_id).to eq(board.id)
    expect(board.memberships.first.member_id).to eq(larry_id)
  end

  it "has a member" do
    expect(board.members.first.name).to eq("Larry Page")
  end

  it "has a single exchange" do
    nasdaq = Exchange.find_by_name("NASDAQ")
    expect(board.exchange).to eq(nasdaq)
  end

  describe "validations" do 
    it "require board to have a company" do
      is_expected.to validate_presence_of(:company).with_message(/must exist/)
    end
  end
end
