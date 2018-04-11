Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api, defaults: { format: 'json' } do
    resources :tweets do
      # on member will only put nested routes for parent routes with an id
      resources :comments, on: :member, only: :index
    end
    resources :comments, only: :destroy
    resources :users, only: [:show, :create]
    # no more new routes
    resource :session, only: [:destroy, :create]
  end

  # resources :tweets
  # # get '/wiki_redirect', to: 'demos#wiki'
  # # get '/set_cookie', to: 'demos#set_cookie'
  # get '/ajax_fun_time', to: 'demos#ajax_demo'
  #
  # resources :users, only: [:new, :create, :show]
  #
  # # singular resource b/c we don't need an id, only ever have one session in browser
  # # but controller is plural
  # resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # five http request types:
  # get requests: getting stuff
  # post: creating stuff
  # patch/put: updating stuff
  # delete: deleting stuff

  # get request to /tweets will go to tweets controller, index action
  # get '/tweets', to: 'tweets#index'
  # rails will call whatever param is after '/tweets/' :id
  # get '/tweets/:id', to: 'tweets#show'
  # even though show has same path, rails will differentiate by request type
  # post '/tweets', to: 'tweets#create'

  # plural resourceS for routes with :id
  # makes all 8 routes for us
end
