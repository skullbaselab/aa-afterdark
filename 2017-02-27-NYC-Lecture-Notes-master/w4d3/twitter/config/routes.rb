Rails.application.routes.draw do
  root to: 'tweets#index'
  get "get_cookie", to: "tweets#get_cookie"
  get "set_cookie", to: "tweets#set_cookie"
  resources :tweets, only: [:index, :new, :create, :edit, :update]
  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :show]
end
