PostsApp::Application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :posts
  resources :tags, only: [:create, :destroy]

  root to: "sessions#new"
end
