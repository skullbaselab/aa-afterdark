FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    f_name { Faker::Name.first_name }
    l_name { Faker::Name.last_name }
  end
end