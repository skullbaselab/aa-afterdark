Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api do
    resources :listings, only: [:create, :destroy, :index]
    get 'listings/search/', to: 'listings#search'
  end
end
