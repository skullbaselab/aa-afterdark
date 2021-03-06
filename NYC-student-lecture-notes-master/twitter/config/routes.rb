Rails.application.routes.draw do
  root to: "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resources :tweets, only: [:index, :create]
    resources :users, only: [:create]
  end
end
