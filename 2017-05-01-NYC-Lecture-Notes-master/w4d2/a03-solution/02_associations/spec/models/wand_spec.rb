require 'spec_helper'

describe Wand do
  it "knows its owner" do
    expect(Wand.first.owner.fname).to eq("Harry")
  end
end
