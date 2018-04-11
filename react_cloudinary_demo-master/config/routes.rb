Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :images, only: [:create, :index]
  end

  root to: 'static_pages#root'
end
