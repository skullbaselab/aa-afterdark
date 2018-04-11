require 'rails_helper'

RSpec.describe Price, type: :model do
  subject(:price) { Price.first }

  it "has a company" do
    expect(price.company.name).to eq("Google")
  end

  describe "validations" do 
    it "require price to have a company" do 
      is_expected.to validate_presence_of(:company).with_message(/must exist/)
    end
  end
end
