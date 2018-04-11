TweetsApp::Application.routes.draw do
  resources :users
  resource :session
  resources :tweets
  resources :replies, :only => [:create, :destroy]
end
