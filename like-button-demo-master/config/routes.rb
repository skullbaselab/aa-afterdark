Rails.application.routes.draw do
  root to: "static_pages#root"

  # resource :session, only: [:create, :destroy, :new]
  # resources :users, only: [:create, :new]

  namespace :api, defaults: { format: :json } do
    resources :likes, only: [:create, :destroy]
    resources :photos, only: [:index, :show]
  end
end
