Rails.application.routes.draw do


  resources :users
  resource :session, only: [:create, :destroy, :new]
  # get "get_cookie", to: "sessions#get_cookie"
  # get "set_cookie", to: "sessions#set_cookie"
  # get "set_flash", to: "sessions#set_flash"
end
