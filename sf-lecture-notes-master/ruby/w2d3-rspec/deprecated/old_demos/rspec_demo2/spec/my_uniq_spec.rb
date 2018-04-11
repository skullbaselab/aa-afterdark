require 'rspec'
require 'my_uniq'

describe "#my_uniq" do
  it "should return only uniq. val.s from an array" do
    expect(my_uniq([1, 1, 2, 2, 3, 3])).to eq([1, 2, 3])
  end
end