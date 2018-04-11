require 'hamster'
require 'byebug'

describe Hamster do

  subject(:hamster) { Hamster.new('Hamtaro?', 1) }

  describe '#name' do

    it 'should return name' do
      # hamster = Hamster.new('Hamtaro?', 1)
      other_hamster = Hamster.new('Bijou', 2)
      expect(hamster.name).to eq('Hamtaro?')
      expect(other_hamster.name).to eq('Bijou')
    end
  end

  describe '#eat_carrot' do

    it 'should make hamster stronger' do
      # hamster = Hamster.new('Hamtaro!!', 1)
      old_strength = hamster.strength
      hamster.eat_carrot
      expect(hamster.strength).to be > old_strength
      # expect(hamster.strength > old_strength).to be(true)
    end
  end

  describe '#swole?' do

    it 'should return false for strength <= 10' do
      # expect(hamster.swole?).to be false
      expect(hamster).not_to be_swole
    end

    let(:swole_hamster) { Hamster.new('The Rock', 11) }

    it 'should return true for strength > 10' do
      expect(swole_hamster).to be_swole
    end
  end

  describe '#climb_stairs' do

    context 'when not swole' do
      it 'should raise a WeakError' do
        expect { hamster.climb_stairs }.to raise_error(WeakError)
      end

    end

    context 'when swole' do
      it 'should not raise an error' do
        10.times { hamster.eat_carrot }
        expect { hamster.climb_stairs }.not_to raise_error
      end
    end
  end

  describe '#encouter_bird' do

    let(:pigeon) { double('piggy', type: 'pigeon', strength: 1) }
    let(:hawk) { double('hawkey') }

    context 'when bird is a pigeon' do

      it 'should fight' do
        expect(hamster).to receive(:fight)
        hamster.encounter_bird(pigeon)
      end
    end

    context 'when bird is a hawk' do

      it 'should run and scream NONONONO' do
        allow(hawk).to receive(:type).and_return('hawk')
        expect(hamster).to receive(:run)
        expect(hamster).not_to receive(:fight)
        hamster.encounter_bird(hawk)
      end
    end
  end
end
