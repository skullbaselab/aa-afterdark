Rails.application.routes.draw do
  # HTTP PATH, to: ControllerName#ControllerAction

  root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index, :create] do
      resources :tweets, only: [:index]
    end
    resources :tweets, except: [:new, :edit]
    # there can only be one current session so we always know what the session is, so no id wildcard needed
    # singular resource -> no id wildcard
    resource :session, only: [:create, :destroy]
  end

  # get '/tweets', to: 'tweets#index'
  # # :id is a wildcard
  # get '/tweets/:id', to: 'tweets#show'
  # post '/tweets', to: 'tweets#create'
end
