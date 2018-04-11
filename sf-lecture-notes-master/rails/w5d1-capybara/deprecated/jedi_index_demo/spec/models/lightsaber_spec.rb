# == Schema Information
#
# Table name: lightsabers
#
#  id         :integer          not null, primary key
#  color      :string(255)      not null
#  jedi_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Lightsaber do
  describe "validations" do
    it { should ensure_inclusion_of(:color).in_array(Lightsaber::COLORS) }
  end

  describe "assocations" do
    it { should belong_to(:owner).class_name('Jedi') }
  end
end
