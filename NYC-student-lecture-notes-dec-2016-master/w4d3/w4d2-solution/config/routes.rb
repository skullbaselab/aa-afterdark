NinetyNineCatsDay1::Application.routes.draw do
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
    #member allows us to create a url that has an id wildcard (:id)
    #and thus refer to a particular request
  end

  root to: redirect("/cats")
end
