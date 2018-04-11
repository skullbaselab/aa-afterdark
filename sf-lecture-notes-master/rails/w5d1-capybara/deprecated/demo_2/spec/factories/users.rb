# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    f_name { Faker::Name.first_name }
    l_name { Faker::Name.last_name }
  end
end
