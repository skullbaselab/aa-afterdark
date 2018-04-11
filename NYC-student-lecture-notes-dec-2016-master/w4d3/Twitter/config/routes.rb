Rails.application.routes.draw do

  root to: 'tweets#index'

  resources :users, only: [:show, :new, :create]
  resources :tweets, only: [:new, :create, :edit, :update, :index]
  resource :session, only: [:new, :create, :destroy]

  get "get_cookie", to: "sessions#get_cookie"
  get "set_cookie", to: "sessions#set_cookie"
  get "set_flash", to: "sessions#set_flash"
  get "get_flash", to: "sessions#get_flash"
end
