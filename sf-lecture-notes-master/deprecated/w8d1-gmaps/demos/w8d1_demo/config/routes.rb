Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :demos, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
