Rails.application.routes.draw do
  # get "/cats", to: "cats#index" # see all the cats
  # get "/cats/:id", to: "cats#show" # show a single cat
  # post "/cats", to: "cats#create" # make a cat
  # delete "/cats/:id", to: "cats#destroy" #byebye cat
  # patch "/cats/:id", to: "cats#update"
  get '/happy_kitty/:name', to: 'cats#happy_kitty'
  resources 'cats', only: [:index, :show, :create, :destroy, :update]
end
