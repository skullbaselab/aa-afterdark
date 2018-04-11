require 'rails_helper'

RSpec.describe Exchange, type: :model do
  subject(:nyse) { Exchange.first }
  
  it "has a company" do
    expect(nyse.companies.first.name).to eq("Google")
  end
end
