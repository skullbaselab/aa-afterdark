Rails.application.routes.draw do

  root to: 'tweets#index'

  resources :users, only: [:show]
  resources :tweets, only: [:new, :create, :edit, :update, :index]

end
