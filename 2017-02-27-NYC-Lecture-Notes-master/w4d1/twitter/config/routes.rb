Rails.application.routes.draw do
  # Representational State Transfer (ReSTful Routes)

  # # route that will invoke index action of tweets controller
  # get '/tweets', to: 'tweets#index', as: 'tweets'
  #                     # ^^ controller#action
  # post '/tweets', to: 'tweets#create'
  # get '/tweets/new', to: 'tweets#new', as: 'new_tweet'
  #                                           # ^^ creates prefixes for rails helpers
  # get '/tweets/:id/edit', to: 'tweets#edit', as: 'edit_tweet'
  #             # ^^ wildcard stand-in for id of tweet we want to edit
  # get 'tweets/:id', to: 'tweets#show', as: 'tweet'
  # delete 'tweets/:id', to: 'tweets#destroy'
  # put 'tweets/:id', to: 'tweets#update'
  # patch 'tweets/:id', to: 'tweets#update' #samesies (mostly; we'll prefer PATCH)

  # get '/', to: 'tweets#index'
  root to: 'tweets#index'


  resources :tweets, except: [:new, :edit] do # could also use only: [:thing] to similar effect
    resources :hash_tags, only: [:create]
  end
end
