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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lightsaber do
    color { Lightsaber::COLORS.sample }
    jedi # Will make a Jedi and assign it
  end
end
