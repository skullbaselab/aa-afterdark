Rails.application.routes.draw do
  root to: 'static_pages#root'

  # What does namespace do?
  # Nests all of these routes under API
  namespace :api, defaults: {format: :json} do
    resources :posts, only: [:index, :update]
  end
end
