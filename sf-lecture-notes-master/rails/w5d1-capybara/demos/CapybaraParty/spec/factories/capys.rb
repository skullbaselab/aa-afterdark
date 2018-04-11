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

FactoryGirl.define do
  factory :capy do
    name { Faker::Name.name }
    color { Faker::Color.hex_color }

    factory :no_name do
      name nil
    end

    factory :sparkly do
      color 'sparkly'
    end

    factory :rainbow do
      color 'rainbow'
    end
  end

end
