Rails.application.routes.draw do

  get '/:type/world', to: 'static_pages#hello'

  get '/hacking', to: 'static_pages#hacking'

  resources :users, except: [:destroy] do
    resources :tweets, only: [:index]
  end

  # get '/tweets', to: 'tweets#index'
  #
  # patch '/tweets/:id', to: 'tweets#update'
  #
  # post '/tweets', to: 'tweets#create'
  #
  # delete '/tweets/:id', to: 'tweets#destroy'
  #
  # get 'tweets/:id', to: 'tweets#show', as: 'tweet'

  resources :tweets, except: [:destroy]

end
