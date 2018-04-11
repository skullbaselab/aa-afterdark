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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jedi do
    sequence(:name) { |num| "Obi-Wan #{num}"}
    darkside false
    master false

    factory :jedi_master do
      sequence(:name) { |num| "Yoda #{num}" }
      master true
    end

    factory :sith do
      name { Faker::Name.name }
      darkside true
    end
  end

end
