RSpec.describe Jersey, :type => :model do
  subject(:jersey) { Jersey.find(1) }
  let(:giant_george) { Player.find(1) }

  it 'belongs to a player' do 
    expect(jersey.player).to eq(giant_george)
  end
end
