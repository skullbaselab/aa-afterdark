RSpec.describe Seat, :type => :model do
  subject(:seat) { Seat.find(1) }
  let(:joe) { Fan.find_by(name: 'Joe') }
  let(:flyers_stadium) { Stadium.find_by(name: 'Discus Dome') }

  it 'is owned by a fan' do 
    expect(seat.owner).to eq(joe)
  end

  it 'is associated with a stadium' do
    expect(seat.stadium).to eq(flyers_stadium)
  end
end
