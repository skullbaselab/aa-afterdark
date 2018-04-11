# == Schema Information
#
# Table name: jedis
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  darkside   :boolean          default(FALSE), not null
#  master     :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Jedi do

  subject(:jedi) { build(:jedi) }

  it { should be_valid }
  it { should_not be_master }
  it { should_not be_darkside }

  describe "validations" do
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name) }

    it { should ensure_inclusion_of(:darkside).in_array([true, false]) }

    it { should ensure_inclusion_of(:master).in_array([true, false]) }
  end

  describe "associations" do
    it { should have_one(:lightsaber) }
  end

  describe "#powers" do
    let(:jedi_powers) { [:mind_control, :force_jump] }
    let(:jedi_master_powers) { jedi_powers + [:force_absorb] }
    let(:sith_powers) { [:force_crush, :force_push] }
    let(:sith_master_powers) { sith_powers + [:force_lightning] }

    context "as Jedi" do
      it "should have mind control and force jump" do
        jedi = build(:jedi)
        expect(jedi.powers).to eq(jedi_powers)
      end
    end

    context "as Jedi master" do
      it "should have mind control, force jump, & force absorb" do
        master = build(:jedi_master)
        expect(master.powers).to eq(jedi_master_powers)
      end
    end

    context "as Sith" do
      it "should have force crush and force push" do
        sith = build(:sith)
        expect(sith.powers).to eq(sith_powers)
      end
    end

    context "as Sith master" do
      it "should have force crush, force push, & force lightening" do
        sith_master = build(:sith, master: true)
        expect(sith_master.powers).to eq(sith_master_powers)
      end
    end
  end

  describe "::sith_amongst_us" do
    it "should reveal who the Sith are" do
      3.times { create(:jedi) }
      2.times { create(:jedi_master) }
      sith = [create(:sith), create(:sith, master: true)]
      expect(Jedi.sith_amongst_us).to eq(sith)
    end
  end
end
