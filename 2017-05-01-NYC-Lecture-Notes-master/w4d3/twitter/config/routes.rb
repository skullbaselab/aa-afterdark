Rails.application.routes.draw do
  # root to: 'tweets#index'

  resources :tweets

  get "get_cookie", to: "sessions#get_cookie"
  get "set_cookie", to: "sessions#set_cookie"
  get "set_flash", to: "sessions#set_flash"
  get "get_flash", to: "sessions#get_flash"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

end
