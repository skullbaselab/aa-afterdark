require 'rails_helper'

RSpec.describe Company, type: :model do
  subject(:com) { Company.first }

  it "has an exchange" do
    expect(com.exchange.name).to eq("NASDAQ")
  end

  it "has a price" do
    expect(com.prices.length).to eq(10)
    com.prices.each do |price|
      expect(price.company_id).to eq(com.id)
    end
  end

  it "has a watch list" do
    expect(Company.first.watch_lists.first.name).to eq("big winners")
  end

  it "has a watcher" do
    expect(Company.first.watchers.first.username).to eq("stevej")
  end

  it "has a board" do
    expect(com.board.company_id).to eq(com.id)
  end

  describe "validations" do 
    it "allow company to optionally have an exchange" do
      expect do Company.create!(
        name: "App Academy"
      )
      end.to_not raise_error
    end
  end
end
