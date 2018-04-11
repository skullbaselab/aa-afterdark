NinetyNineCatsDay1::Application.routes.draw do
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    # member?? as opposed to on: :collection
    # this route is for a specific CatRentalRequest, not for the
    # whole collection
    post "deny", on: :member
    # these should probably be patch requests TBH
  end

  root to: redirect("/cats")
end
