# W4D1

---

### 3 down, 3 to go

---

![hang-in-there](https://media.giphy.com/media/ln4bohPvHhwgo/giphy.gif)

---

![sf-eclipse](https://media.giphy.com/media/l1J3Ci6XLL9JfFhgk/giphy.gif)

---

![my-eclipse](https://media.giphy.com/media/84BjZMVEX3aRG/giphy.gif)

---

### Lecture Agenda

1. Today's Material
1. Quiz Solutions
1. Open Forum
  1. Homework Solutions
  1. Questions from Yesterday's Projects

---

### Learning Goals

1. Understand the request - response cycle
1. Familiarize yourself with routing
1. Familiarize yourself with the C of MVC

---

![Rails](http://media.tumblr.com/f145fa01dd8cadd28537194de00cda59/tumblr_inline_mptqzmW6Bj1qz4rgp.png)

Note: Recap what they currently know in the MVC framework (i.e. the model)

---

### Request - Response Cycle

1. Client makes HTTP request, backend (Rails) processes it
1. Router matches HTTP request's method + path to controller action
1. Generates instance of controller + executes action / method
1. As part of controller action, should render **OR** redirect as response
1. Connection between client + server is closed - controller instance deleted

---

### Anatomy of Request + Response (for now)

+ Request
  + method, path, query string, body
+ Response
  + status, body

Note: google common status

---

### Side Note: Application Programming Interface (API)

+ interface: `the point where two subjects meet and interact`
+ widely used term: really just refers to the point of interaction between
a developer and an application
  + public methods within class
  + routes
+ in web development, will most likely refer to the public web services
developers can hit with HTTP requests

---

### Routing in Rails

+ Rails Router maps request method + pattern combinations to specific controller actions
+ Defines the structure of your application's API in `config/routes.rb`
+ Syntax: `<HTTP method> <URL pattern>, to: <ControllerName#action>`
+ Example: `get "users/:id", to: "users#show"`

---

### Representational State Transfer (REST)

+ Create - Read - Update - Delete (CRUD)
+ philosophy that complicated actions should be thought of in terms of CRUD
  + instead of "liking an object", create an instance of the Like class
+ Statelessness
  + once request - response cycle is over, connection between client and server is lost
  + data is stored either client-side on the browser or server-side in a database
+ much more to it - enough for now

---

### Resources

+ `rails routes`: command to view currently defined routes
+ Shortcut to defining RESTful routes:
  + Syntax: `resources :<Controller Name>, options_hash`
    + options_hash can contain `only` + `except` values
  + Example: `resources :users`
  + Produces: `create`, `new`, `show`, `index`, `edit`, `update`, `delete`

---

### Code Demo

Note: demonstrate long and short ways of defining RESTful resources and
briefly talk about nested resources

---

### Side Note: Nested Resources

+ there should be exactly one URL which maps to the representation of a resource
  + `/articles/101` and `/magazines/42/articles/101` is redundant
+ the good: nested `index` routes that are filtered by top level resource
  + user's chirps and chirp's likes
+ the bad: nested `create` and non-READ routes
  + very little benefit to nesting non-READ routes in most cases

---

### Controller

+ middleman between model + view
+ Command: `rails g controller <Controller Name>`
  + `Controller Name` is the pluralized version of the model name
+ after controller instance initialization
  + interacts with model to fetch data
  + builds and sends a response or redirects to a different path
  + closes connection - discards instance variables and controller instance

---

### JavaScript Object Notation (JSON)

+ very similar to Ruby's Hash Notation
+ a lightweight way to store information in an organized, easy-to-access manner
+ Why is it important?
  + a lot of public API's will respond with and to JSON
  + today, we will solely be responding with data and, therefore, JSON

---

### Parameters (params)

+ `ActionController::Base#params`: every controller will inherit this method
+ Rails' method of passing data into the controllers in the request
+ three sources
  + Route parameters (e.g. the `:id` from `/users/:id`)
  + Query string (the part of the URL after the `?`: `?key=value`)
  + POST/PATCH request data (the body of the HTTP request)

---

### Whitelisting Params

+ be careful to restrict which attributes a user can assign
+ The `#permit` method of the hash-like object returned by `#params` "whitelists" attributes
+ All other non-whitelisted attributes will be ignored
+ Without whitelisting attributes, you cannot create or update an instance of a model class

---

```ruby
private

def user_params
  params.require(:user).permit(:username, :email)
end
```

---

# Blue Bird Demo

---

### Quiz

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/rails/w4d1.md)

---

# Open Forum

---

### Homework

[Solutions](https://github.com/appacademy/curriculum/tree/master/rails/homeworks/library/solution)

---

### Yesterday's Project

[CSS Flex Exercise](https://github.com/appacademy/curriculum/tree/master/html-css/micro-projects/flex)

[Active Record Lite](https://github.com/appacademy/curriculum/tree/master/sql/projects/active_record_lite/solution)

---
