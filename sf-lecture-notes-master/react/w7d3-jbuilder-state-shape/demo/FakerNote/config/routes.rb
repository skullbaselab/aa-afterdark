
Rails.application.routes.draw do
  root to: 'static_pages#root'
  
  namespace :api, defaults: {format: :json} do
	  resources :users do
	  	resources :notebooks do
	  		resources :notes
	  	end
		end
	end
end
