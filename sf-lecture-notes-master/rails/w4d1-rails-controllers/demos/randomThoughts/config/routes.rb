Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create] do
    resources :likes, only: [:index]
  end
  # get 'users/:user_id/likes', to: 'users#likes'

  resources :likes, only: [:create, :destroy, :index, :show]
# localhost:3000/likes
  # posts
  resources :posts, only: [:create, :update, :index, :show, :destroy]
  # post-likes?
end
