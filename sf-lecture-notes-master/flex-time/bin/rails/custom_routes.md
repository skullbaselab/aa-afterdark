# Routes

Routes come in 2 flavors, `member` and `collection` routes.

Let's explain to our students what the main difference between the two is, as this will help when creating [more RESTful actions](guides.rubyonrails.org/routing.html#adding-more-restful-actions). 

We can think of member routes as the routes that act upon a specific resource (as opposed to the collection overall), hence, they require an `:id`.
Ask your students for the 7 actions that can act upon resources, list them out and ask which ones should be considered members. And verify that our previous assumption is right.

Actions for member routes:
 + show
 + edit
 + update / patch
 + destroy

The remaining actions dont need a particular `:id` to properly work:
 + index
 + new
 + create
 
Now that we know the different type of routes, how can we produce these with rails?

Use of the `resource(s)` keyword.

```ruby
  resources :photos
```

Will result in  8 routes (2 for update). The difference between the two is covered in [this StackOverflow question](https://stackoverflow.com/questions/21660791/what-is-the-main-difference-between-patch-and-put-request).

Put simply:

> With PUTS, the enclosed entity in the request body contains a new resource that should be uploaded **in the place of** the current resource (hence **putting** it in)

> With PATCH, however, the enclosed entity contains a set of instructions describing how a resource currently residing on the origin server should be modified to produce a new version (hence **patching**)

```
    Prefix Verb   URI Pattern                Controller#Action
    photos GET    /photos(.:format)          photos#index
           POST   /photos(.:format)          photos#create
 new_photo GET    /photos/new(.:format)      photos#new
edit_photo GET    /photos/:id/edit(.:format) photos#edit
     photo GET    /photos/:id(.:format)      photos#show
           PATCH  /photos/:id(.:format)      photos#update
           PUT    /photos/:id(.:format)      photos#update
           DELETE /photos/:id(.:format)      photos#destroy
```

**Easter Egg:** if your Rails App was created on `API Mode` the `new` action will not be generated, as it will be of no use in a REST _endpoint_.

So, what about routes created with the `resource` keyword?
They are referred as _Singular Resource_, extract from [rails doc](http://guides.rubyonrails.org/routing.html)
  > Sometimes, you have a resource that clients always look up without referencing an ID. For example, you would like /profile to always show the profile of the currently logged in user. In this case, you can use a singular resource to map /profile (rather than /profile/:id) to the show action

In our case, lets think about the `SessionsController`, this seems like the perfect example for a singular resource. It should come as no susprise that using `resource:` will only create URI Pattern routes without an `id`.

## Member / Collection routes.
There are several ways of creating custom routes.
 + We can generate routes to act upon existing resources via the member / collection routes. 
  ```ruby
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post 'approve'
      post 'deny'
    end
  end

  resources :cat_rental_requests, only: [:new, :create] do
    post 'approve', on: :member
    post 'deny', on: :member
  end
  ```
Ask your students what will happened if they add custom member routes on single resource routes, they wont have the interpolated :id

## Root and custom routes
If none of the above is enough for your route, you can always explicitly set the  HTTP Verb, URI Pattern, Controller to be instantiated and the method to be executed. 
```ruby
root to: 'posts#index'
# the #as: clause will create the prefix, without it there will not be a prefix
get '/patients/:id', to: 'patients#show', as: 'patient'
```
