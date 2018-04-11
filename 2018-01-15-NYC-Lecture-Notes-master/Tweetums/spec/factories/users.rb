FactoryBot.define do
  factory :user do
    username 'cool_mashu'
    password 'starwars'
    
    # can nest blocks when want to override some attributes but keep others from above
    factory :bad_user do 
      username 'uncool'
      password 'short'
    end
  end
end