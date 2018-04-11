FriendlyKaminariDemo::Application.routes.draw do
  root :to => "root#root"
  resources :dogs, only: [:index, :show]
end
