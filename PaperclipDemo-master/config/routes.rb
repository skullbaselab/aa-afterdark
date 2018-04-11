PaperclipDemo::Application.routes.draw do
  resources :pirates
  root to: "pirates#index"
end
