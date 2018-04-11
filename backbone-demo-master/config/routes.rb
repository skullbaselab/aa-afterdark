BackboneDemo::Application.routes.draw do
  root :to => "site#root"
  
  namespace :api, :defaults => { :format => :json } do
    resources :todos, :only => [:create, :destroy, :index, :show, :update] do
      resources :comments, :only => [:index]
    end

    resources :comments, :only => [:create, :destroy, :show, :update]
  end
end
