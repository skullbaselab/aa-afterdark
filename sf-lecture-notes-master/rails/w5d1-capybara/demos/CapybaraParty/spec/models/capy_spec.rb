# == Schema Information
#
# Table name: capys
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  color      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Capy, type: :model do
  # To test:
  # validations
  # associations
  # class methods - ::capys_of_the_rainbow


  let(:capy) { Capy.new(name: 'carlo') }
  let(:nameless_capy) { Capy.new }

  it 'should validate presence of name' do
    expect(nameless_capy.valid?).to be false
  end

  describe 'validations' do
    before(:each) do
      FactoryGirl.create(:sparkly)
    end
    
    # This also gives you a better error message
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:color) }

  end

  describe 'associations' do

    # it 'should have many parties'
    it { should have_many(:parties) }

    # it 'should have many attendances'
    it { should have_many(:attendances) }
    it { should have_many(:parties_to_attend).through(:attendances) }

    it 'should have many parties to attend'
  end

  describe '::capies_of_the_rainbow' do
    let(:sparkly) { FactoryGirl.create(:sparkly) }
    let(:rainbow) { FactoryGirl.create(:rainbow) }

    # let(:rainbow) { FactoryGirl.build(:capy) }

    it 'should contain rainbow capybaras' do
      expect(Capy.capys_of_the_rainbow.where_values_hash).to eq({"color" => 'rainbow'})
    end

    it 'should contain rainbow capybaras' do
      expect(Capy.capys_of_the_rainbow).to include(rainbow)
      expect(Capy.capys_of_the_rainbow).not_to include(sparkly)
    end
  end
end
