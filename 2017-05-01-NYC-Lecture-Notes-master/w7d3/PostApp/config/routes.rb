Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    # all of these routes render json responses by default
    resources :posts, only: [:index, :update]
  end
end
