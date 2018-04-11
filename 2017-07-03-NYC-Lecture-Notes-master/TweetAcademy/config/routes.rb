Rails.application.routes.draw do
  root to: 'static_pages#root'

  resource :session, only: [:new, :create, :destroy]


  namespace :api, defaults: { format: :json } do
    resources :users, only: [:new, :create, :index, :show]
    resources :tweets
    resources :lists, only: [:index, :show, :create]
  end


  # v these were just for testing cookies
  # get '/set_cookie', to: 'tweets#set_cookie'
  # get '/get_cookie', to: 'tweets#get_cookie'
  # get '/set_flash', to: 'tweets#set_flash'
  # get '/get_flash', to: 'tweets#get_flash'
  # get '/get_session', to: 'tweets#get_session'
  # get '/set_session', to: 'tweets#set_session'
end
