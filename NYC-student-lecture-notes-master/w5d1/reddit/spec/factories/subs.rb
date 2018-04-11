# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    name { Faker::Name.name }
    description 'Any text you want'
    association :moderator, factory: :user
  end
end
