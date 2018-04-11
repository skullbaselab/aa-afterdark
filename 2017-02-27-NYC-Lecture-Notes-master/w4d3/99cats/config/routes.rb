NinetyNineCatsDay1::Application.routes.draw do
  resources :cats, except: :destroy
  resources :cat_rental_requests do
    post "approve", on: :member
    post "deny", on: :member
  end
  # same as line 4:
  # post to: "cat_rental_requests/:id/approve", as: "approve_cat_rental_request"

  root to: redirect("/cats")
end
