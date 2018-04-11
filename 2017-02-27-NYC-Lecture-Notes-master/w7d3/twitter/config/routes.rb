Rails.application.routes.draw do
  root to: 'tweets#index'

  # resources :tweets, only: [:index, :new, :create, :edit, :update]
  # resource :session, only: [:create, :destroy, :new]
  # resources :users, only: [:create, :new, :show]

  # look for json.jbuilder extensions
  namespace :api, defaults: { format: :json } do
    resources :tweets, only: [:index, :show]
  end
end
