JournalApp::Application.routes.draw do
  resources :posts

  root :to => "root#root"
end
