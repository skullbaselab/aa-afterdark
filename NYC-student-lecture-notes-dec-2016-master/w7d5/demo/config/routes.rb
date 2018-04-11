Rails.application.routes.draw do
  root "static_pages#root"
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :tweets, only: [:index, :create]
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy, :show]
  end
end
