FactoryBot.define do
  factory :user do
    username { Faker::Seinfeld.character }
    password { Faker::Internet.password(6) }

    factory :invalid_user do
      password '12345'
    end

    factory :auth_user do
      username 'auth_user'
      password 'starwars'
    end
  end
end
