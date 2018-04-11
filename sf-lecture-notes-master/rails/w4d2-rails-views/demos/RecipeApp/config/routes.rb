Rails.application.routes.draw do
  resources :recipes, only: [:show, :index] do
  	resources :reviews, only: [:create, :update, :edit]
  end
  resources :reviews, only: [:destroy]
  root to: "recipes#index"
end
