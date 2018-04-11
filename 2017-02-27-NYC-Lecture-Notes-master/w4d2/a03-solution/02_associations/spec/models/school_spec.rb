require 'spec_helper'

describe School do
  subject(:hogwarts) { School.find_by_name("Hogwarts") }

  it "protects residents" do
    harry = Wizard.find_by_fname("Harry")
    ron = Wizard.find_by_fname("Ron")
    hermy = Wizard.find_by_fname("Hermione")
    albus = Wizard.find_by_fname("Albus")
    expect(hogwarts.residents).to include(harry, ron, hermy, albus)
  end

  it "is run by a headmaster" do
    expect(hogwarts.headmaster.lname).to eq("Dumbledore")
  end

end
