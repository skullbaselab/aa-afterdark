FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password_digest { Faker::Internet.password }
    session_token { Faker::Internet.password }
  end
end
