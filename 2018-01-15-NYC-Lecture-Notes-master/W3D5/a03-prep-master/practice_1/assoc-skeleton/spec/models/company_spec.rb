require 'rails_helper'

RSpec.describe Company, type: :model do
  subject(:com) { Company.find_by_name("Google") }

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
    expect(Company.find_by_name("Google").watch_lists.first.name).to eq("big winners")
  end

  it "has a watcher" do
    expect(Company.find_by_name("Google").watchers.first.username).to eq("stevej")
  end

  it "has a board" do
    expect(com.board.company_id).to eq(com.id)
  end

  describe "subsidiary company" do
    it "has a parent company" do
      expect(com.parent_company.name).to eq("Alphabet")
    end
  end

  describe "parent company" do
    it "has subsidiaries" do
      expect(com.parent_company.subsidiaries.first).to eq(com)
    end
  end

  describe "validations" do
    it "allow company to optionally have an exchange" do
      expect do Company.create!(
        name: "App Academy",
        parent_company: Company.find_by_name("Alphabet")
      )
      end.to_not raise_error
    end

    it "allow company to optionally have a parent company" do
      expect do Company.create!(
        name: "App Academy",
        exchange: Exchange.find_by_name("NYSE")
      )
      end.to_not raise_error
    end
  end
end
