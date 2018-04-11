FactoryGirl.define do
  factory :link do
    title { Faker::App.name }
    url { "http://#{ Faker::Internet.domain_name }"}
    association :user, factory: :user
  end
end
