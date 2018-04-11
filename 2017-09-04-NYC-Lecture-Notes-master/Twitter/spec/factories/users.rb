FactoryGirl.define do
  factory :user do
    username { |n| Faker::Internet.user_name }
    password { |p| Faker::Internet.password }
    state_id { |s| State.create!(name: Faker::Address.state).id }
  end
end
