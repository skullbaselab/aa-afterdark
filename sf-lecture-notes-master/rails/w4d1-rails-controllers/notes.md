# Routing, Controllers, API
## Topics
### Routing basics
* router matches http paths to controllers and actions
* `resources whatever` gives you 7 actions (8 including put)
* all of CRUD covered
* `rake routes`,
* path helpers `cats_url`, don't make urls by hand
* button helpers
* controller filename, class name inferred

### Controllers
* router instantiates a controller, calls action
* controller uses model and view to prepare and issue response
* router calls an action: a public controller method

* `#params` is a hash like object that holds data from body, path, query string
* strong parameters - rails enforces that for `params` to be used for mass
  assignment, they must be `permitted`
* put this in a helper method
* instantiated by router, after controller issues response DIES FOREVER
* instance variables DO NOT persist
* params object

### JSON API
* responds with a JSON string instead of an HTMl document
* models have a `to_json` method for this purpose

### Nested Routes
* nested resources with block
* create, show, put, patch, delete can be nested shallowly to remove redundancy
* only, except

## Project
### First Routes
* experiment with `resources` and rake routes
* generate a users controller to go with routes
* `addressable/uri` and `rest-client` to make a script in `bin` that makes reqs
* add an index action, then render text
* add query string vals to request and see in log
* rendering json in controller
* create user from json, render messages upon error too

### Contacts
* contacts model, user model
* contact share
* users controller with CRUD
* lots of testing with post man

## Demo
* show diagram
* generate a model
* make  resources routes
* make requests using broswer, post-man
* make controller, spell filename wrong first
* set root to: `users#index`
* talk alot about the params hash
* controller can create things
* nested routes
* fighters, hobbies

# Brooke Notes 7/29

## Video Notes

### What is an API?
* API - application programming interface
* Published interface for how software works and how to use it
* Rails ex. GET /cats => returns cat objects
* Website: website, sends back a bunch of assets to be rendered by browser like HTML, css, js, images. Browser renders.
* Web service (API): sends back raw data, like JSON
* We might want just data. Helps us split up our app into various components. Could be for mobile app, server <=> server communication, client side rendering of data

### HTTP Request / Response

* Client makes a HTTP (hypertext transfer protocol) Request to server, gets back an HTTP Response
* Request is like a letter - what data does it contain?
  * Client:
    * Method: GET, PUT, PATCH, etc.
    * Path: /users
    * Query: ?loc=sanfrancisco
    * Body: Comes from a form, also key-value pairs (no Body in GET request)
  * Server:
    * Status: what happened on the server? 200 OK, 404 Not Found, etc.
    * Body: HTML, etc.
* Rails just helps us take a request and populate a response with whatever we want to populate it with.

### Rails Routing

* Restful Routes - relies on URL and verb combo, good for CRUD application
* HTTP Request comes in
* Hits Rails Router - determines who to send this to
  * Determines this using **path** and **method** of request
  * Has a list of which paths and methods link to which controller
  * Also tells Controller which action to invoke
* Once the correct one is found - initialize the correct controller, then call the right action
* You describe routes in a routes.rb file
* Refer to diagram - https://blog.chattyhive.com/wp-content/uploads/2014/01/mvc_detailed-full.png

### Routes Demo
* Routes file lives in `config/routes.rb`
* Basic format
  * HTTP method name, path, what controller, what controller action:
    * `get 'superheros', to: 'superheroes#index'`
* REST is the agreed upon way for specifying routes - Representational State Transfer. If we follow conventions, Rails provides a very easy way to create RESTful routes.
  * Consider writing a demo with RESTFUL routes
  * Clean it up to:
    * resources :superheroes, only: [:index, :show, :create, :update, :destroy]
    * We don't need `new` or `edit`, those are just for forms
  * Consider writing a demo with nested routes

### Basic Controller Demo

* Max makes a demo:
  * `get 'silly', to: 'silly#fun'``
  * Use chrome postman extention to test API
  * Consider trying this to do a demo.
  * `class SillyController < ApplicationController` (this is where our controller functionality comes from)
  * We make actions by creating instance methods
  * `SillyController#fun` renders `render json: 'hello'` (JavaScript Object Notation)
  * Talks about params - hash like object given to controller from the router
    * Comes from query string, request body (form), and URL params/route params (wildcards)

### RESTful Controller Demo

  * Max does a `SuperHeroController` demos with RESTful routes
  * Shows params whitelisting
    * Mass assignment bad - there might be some attributes we don't want people to alter - id, etc.
    * Rails will Raise an exception - it makes you whitelist specific attributes
    * `params.require(:superhero)` makes sure everything is nested under the superhero key.
  * Demo `bundle exec rake routes`

## Other things to remember

* Give overview of useful debugging gems and strategies
* Bring up diagram of Rails
* Show how to use postman
* find vs. find_by
* Do some demo where we look at params within various actions, perhaps using fail

## HTML / CSS Curriculum

* HTML - hypertext markup language
* CSS - cascading stylesheets

## Demo

* KittyKats app - talk about pluralization
* Show routes file
* Show rooting
* Talk about what these actions are and what they mean customarily
* Make a controller
* Talk about what our controller has access to
* Show `fail` so we can see what params are
* Show some helpful gems
* Write some custom routes
* show this in the browser or on postman
* Describe what each resourceful route does (new vs. create)
