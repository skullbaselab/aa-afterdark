DeviseDemo::Application.routes.draw do
  resources :tweets

  root to: "root#root"

  devise_for :users, 
             :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
end
