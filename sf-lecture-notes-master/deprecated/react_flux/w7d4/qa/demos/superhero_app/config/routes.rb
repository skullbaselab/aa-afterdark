Rails.application.routes.draw do
  namespace :api do
    resources :superheroes, only: [:index, :show], defaults: { format: :json}
  end
end
