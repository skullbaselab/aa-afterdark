Rails.application.routes.draw do
  root "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resources :tweets, only: [:index, :create, :show]
  end
end
