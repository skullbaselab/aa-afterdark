# W4D2
---
![welcome](https://media.giphy.com/media/ypqHf6pQ5kQEg/giphy.gif)
---
![move](https://media.giphy.com/media/SW3PNayoSGXao/giphy.gif)
---
### Learning Goals

1. Familiarize yourself with the V of MVC
1. Put it all together
1. Complete your first web app
---
![MVC](https://i.giphy.com/media/5PVHPYJAoMjRu/giphy.webp)
---
### Quick Recap
+ Controllers / Server
+ RESTful routes --> Check Rails Routes
---
### View

+ The client-facing portion of Rails
+ Comprises the multiple types of responses from the controller
  + e.g. webpage vs web service
+ Web Page or `Template` Composition
  + HTML
  + CSS
  + JavaScript
---
![Rails](http://media.tumblr.com/f145fa01dd8cadd28537194de00cda59/tumblr_inline_mptqzmW6Bj1qz4rgp.png)
Note: Recap what they currently know in the MVC framework
---

### Controller Rendering
+ Rendering 
  + Views - JSON, HTML
  + Syntax: `render <template>`
  + Example: `render :show`
---
### Embedded Ruby (ERB)

+ HTML templates augmented with Ruby Code
  + `<% Ruby code here %>` - execute Ruby code without a return value
  + `<%= Ruby code here %>` - executes Ruby code with a return value to be embedded into the template
+ Example File: `show.html.erb`
+ ERB code is **NOT** visible to the client / browser
+ Don't try to run `puts` or `print`
+ Comment out by also inserting a # immediately after first %
---
### Rendering Diagram
---
### Forms

+ Time to utilize the `new` and `edit` routes
+ HTML/ERB template to create or update an instance of data
+ Composition:
  + action + method
  + inputs
  + submit button
Note: Stress importance that `new` and `edit` are `get` requests to get the form itself. With those forms we can then gather and `post` data. 
---
### Form Diagram
---
### Controller Redirecting
+ Redirecting
  + Ends current request / response cycle and initializes a second
  + Syntax: `redirect_to <Rails URL Helper>`
  + Example: `redirect_to user_url(id)`
  + Use the prefixes provided to you by `rails routes`
Note: Separation of concerns, not duplicating logic, easy to change it later
---
![completed](https://media.giphy.com/media/oGO1MPNUVbbk4/giphy.gif)
---
# Blue Bird Demo
---
### Controller Rendering

+ Renders the specified template within `application.html.erb`
  + Specifically at `yield`

```ruby
render :edit
render action: :edit
render "edit"
render "edit.html.erb"
render action: "edit"
render action: "edit.html.erb"
render "books/edit"
render "books/edit.html.erb"
render template: "books/edit"
render template: "books/edit.html.erb"
render "/path/to/rails/app/views/books/edit"
render "/path/to/rails/app/views/books/edit.html.erb"
render file: "/path/to/rails/app/views/books/edit"
render file: "/path/to/rails/app/views/books/edit.html.erb"
```
---
### Partials

+ Primary method of refactoring / DRYing up HTML code
+ Example File: `_form.html.erb`
+ Syntax: `render <Partial Filename>, options_hash`
  + Omit the `_` character when inserting the partial's filename
  + Options hash can contain data to be passed into partial
+ Example: `<%= render 'user', user: @user %>`
+ Rails will automagically look for a file of the specified name in the
folder under `Views` that matches the corresponding model name
---
### Rails Helpers

+ `link_to <Link Name>, <URL>`
  + generates an anchor tag to make a GET request
+ `button_to <Button Name>, <URL>, <HTTP Method/Verb>`
  + generates a button tag to make a non-GET request
---
### Debugging

+ Good ol' byebug
  + Keep in mind, you don't have to require gems manually anymore, just bundle install
+ Stack trace
+ `binding_of_caller` and `better_errors` gems
  + Use `fail` for Browser debugger / REPL
---
### And so it begins . . .
---
![shiba](https://i.imgflip.com/1uiu16.jpg)
---
### Quiz

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/rails/w4d1.md)
---
# ty
---