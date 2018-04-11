# 01/01/17
Lecturer: Kelly Chung
Scribe: Cynthia Ma
Topic: Rails Routes and Controllers

## Lecture Questions
+ Are there multiple models for views?
  + Yes.
+ Is the views different from the view displayed in the browser?
  + Yes. The views will contain ruby logic but browser will only display css, html, and javascript.
+ Is the Deletion of the instance of the controller at the end of the request-response cycle specific to Rails or to any backend MVC?
  + Unsure.
+ How long does a cookie last?
  + Up to your design. I'll say ~1 week.
+ What does the & mean in the query string: `search_query=netflex+rxjs&whatever=something`
  + the & marks the end and start of a value.
+ Does root params come before the query string?
  + Yes
+ What are the "+" in the query string?
  + these are interpreted as spaces.

## BlueBird Demo Questions
+ In the routes.rb file, can I write *resources :users* and add custom routes after that?
  + Yes.
+ chirps#index is listed twice. Which route do you want to use?
  + It depends on the situation. Use the one that is relevant.
+ Can you omit *params.require(:user)* from the `params.require(:user).permit(:username,:email)`
  + Yes you may. It will come down to how you nest your params in your form.
+ Why is the status code numbers vs the symbol meaning?
  + Convention is numbers.
+ Can I edit user fields in the `User#create` method?
  + You may. However, the convention is to have fat models and slim controllers. If you wanted to add that logic, add to the model file, not the controller file.
+ Why do we use instance variables anyway if they get deleted after the request-response cycle?
  + the instance variable is accessible for that view html file.
+ In the `User#destroy` method, why should I write a `redirect_to`  instead of `render :show`?
  + We can. However the convention is to redirect. If we were to render, we may not have the correct instance variables from the `User#destroy` method for the `User#show`.

## Quiz Q's


## Immediate Action


# 10/23/17

Lecturer: Isak Mladenoff

Scribe: Andres Alfaro

## Rails routes and controllers

### Questions

+ Do we dive into *websockets*?
  + It depends on your *fullstack*.
+ What are *websockets*?
  + Deferred
+ Is there any HTTP request to *__INAUDIBLE__*.
 + No.
+ Can you do HTTP requests from the console.
  + You can with diverse gems or UNIX command line packages.
+ Can you show the blocks syntax on _routes_ one more time (referring to nested routes).
  + Yes.
+ Could we see the _rails routes_ with the nested routes syntax.
  + Yes, "explains the new change to *__rails__* instead of *__rake__*".

## Bluebird demo

### Questions

+ Are the _params_ always sent in the body.
  + No, they can also be send as _query params_, but more often than not you'll send them in the body.
+ Are the params values nested because of the resource is nested?
  + No, thats the way they need to be provided so that we can mass-assign and white list params.
+ Why do we use instance variables in the controller?
  + We will see down the road that other components of _Rails_ have access to those _instance variables_.
+ If you are just accessing one param, you dont need to whitelist (talking about Mode.find(params[:id])) ?
  + As we are not mass-assigning, we are only retrieving the id, if provided, no need to whitelist.

## Notes
* Repeat questions, last row students are unable to hear some of the questions.
* Sitting in the last rows it's hard to follow the terminal commands, because the code is all the way to the bottom.

# 8/21/17

Lecturer: Kelly  
Scribe: Isak

## Rails routes and controllers

### Questions

* What does `(.:format)` mean?
  * It's a config thing we're not getting into.
* Why don't we want nested READ routes?
  * We do; we don't want everything else. Non-READ routes necessarily have the items specific id in them already. No need to nest.
* Does the chirp belong to the user?
  * Yes, the `chirps` table has a foreign key that refers to the user.
* Do the params also come from the same place `def show`, `def index`, etc. come from?
  * You must define these, they are not given to you.
* _Follow-up:_ when would you want to rename these methods?
  * Pretty much never, convention over configuration.
* If the name aren't what defines RESTful, then what is?
  * What you do in the methods themselves is what does this.
* What prevents keys from my query string from matching up with keys from my [...]?
  * Nothing.
* What is limit to what you can pass in in params?
  * "I don't know," but you just wouldn't pass that much.
* Is it fair to say that `private` `def something_params` is the same as validations.
  * "In a sense."

## Bluebird demo

### Questions

* If you had multiple servers would Postman know where to go?
  * In the weeds, but K. mentioned a brief thing about micro-services.
* Can you do `User.find_by(:id)` instead of `User.find_by(params[:id])`
  * No, undefined.
* It's safe to pass in garbage through `:id` because we aren't `save`ing?
  * Yes

## Quiz

### Questions



## Notes
* Wrong quiz is linked to today.

# 2/13

Lecturer: Shamayel Daoud
Notes by Gage Newman

## AR Lite

+ `execute` vs `execute2`?
  + `execute2` also returns column names
+ `#insert`: why not use attributes hash?
  + we use an array because it allows us to handle different numbers of
  attributes
+ ??
  + two steps: set up association (`foreign_key`, `primary_key`), and do the
  query with the join

## HTML Homework

+ if you have a `-` or an invisible character in your GH username, can you still make a GH repo?
  + i'd think so... but if it doesn't work, IDK
+ should semantic tags be inside the `body`?
  + yes, displayed tags are inside the `body`, outside the body is
  meta-information
+ `gh-pages` or new repo called `username.github.io`?
  + you'd need a branch in that repo if you use the `gh-pages` option
    + can we take exactly what you said and put it in the instructions for the
    homework yesterday?
      + OK
    + so in this case, we don't want to merge the `gh-pages` branch into master?
      + correct, the content needs to be on that branch in order for GH to
      display it

## Rails Homework

+ how does `new` work?
  + `new` and `edit` render forms
    + and if you have nothing in that method?
      + Rails knows to look for a form with the same name as the method
    + and `render :index`?
      + we'll get into it tomorrow
+ you can have multiple `render`/`redirect` statements if they're in separate
control flows?
  + yes
+ `render`/`redirect` is always the last thing the controller does?
  + yes
+ `flash`?
  + a hash-like object that stores errors
+ syntax for `redirect`?
  + wait for the demo
+ `book_params`?
  + wait for the demo
+ is our controller connected to our database?
  + yes, `book.destroy` will actually delete that row from the DB

## Quiz

+ Q1 - if you had two sets of params that collided, would one get overwritten?
  + yes - we structure our params to prevent this from happening
+ Q4 - how do we know that it's `index`?
  + convention
+ Q4 - what is `magazines`?
  + another table
    + is this similar to `powers` and `superheroes`?
      + yes

## Intro Rails

+ the router is really limited - all it does is either error out or create a
controller and call a method on it?
  + correct - the controller is in control of the app
+ 404s are handled in the controller?
  + yes
+ are most of the things the controller does querying the DB and sending
information back?
  + yes
+ if we had a page that didn't have any information from the DB, how would we
handle that?
  + custom route & custom controller, probably
+ what is the model? does it only hold info from the DB?
  + we can write custom methods on our models - custom validations, custom
  query methods, &c.
+ does the router have to have every possible combination of routes?
  + only the ones we want our users to have access to - the ones in our API
+ `only` vs. except?
  + we prefer `only`
+ what is the word for `/users/new`?
  + URI - uniform resource indicator
+ "wildcard" vs. "id" in a route?
  + it doesn't have to be an id - it can be any identifier
+ `:id` in the path?
  + these wildcard identifierrs get put into the params hash
    + so `params[:id] => 1`?
      + yes
+ `post/users` needs to have all the user's information in it?
  + yes
+ `PUT` vs. `PATCH`?
  + old web trivia
+ `new` & `create`; ? & ? ?
  + `edit` & `update` are also paired
+ is it possible to have a form that combines `new` and `edit`?
  + yes - see tomorrow
+ why is `params` "hash-like"?
  + it's not strictly a hash
+ are the params in order `path => body => query string`?
  + no
+ what's the relationship between `require` and validations?
  + `require` filters `params` to make sure the content is clean (whitelisting)
+ when does the `require` filtering happen?
  + when we use `cat_params`
+ will we use a params method on every controller?
  + yes, if the controller has a `create` or an `update` action
+ if we were trying to SQL inject a website, would we have to bypass this?
  + yes
+ so Rails clumps all this info together into `params`?
  + yes

## Demo

+ what's your syntax for `has_many`?
  + if `primary_key` is `id` and `foreign_key` is `class_id` and the class_name
  matches, you can use the shorthand
+ `bundle exec rake routes` vs. `rake routes`?
  + `bundle exec` fixes weird versioning mismatches
    + assessments say always run `bundle exec`?
      + rspecs matter on the test, we run `bundle exec` so you should too
+ `:format` in `rake routes`?
  + allows you to access the `.html` or `.json` extension
+ what is that?
  + JSON
+ ??
  + the server logs are where you go to debug rails - they show what the
  request was, the controller and method that were run, the parameters, and the
  SQL that was run by the controller
+ if you wanted to set up a custom error view?
  + wait to see how we render errors (usually using `flash`)
+ so all of these things - params, controllers - only live for one
request/response cycle?
  + yes
+ are all parameters converted to strings?
  + yes, HTTP is an all-string protocol
+ is there a place where `params` is defined so we can learn more about it?
  + rails source code?
    + how does it know to put "id" when you put "1"?  
      + it's defined in our routes using a convention
    + if our route used "name" rather than "id"?
      + then the params would have "name" => "1"
+ does `index` mean "show all"?
  + basically, yeah
+ ??
  + nested routes typically imply a nested relationship - that toys belong to
  cats
+ why use an instance variable rather than a normal variable?
  + ivars are accessible in views; it's just a habit for me
+ could you use `find_by`?
  + `find_by` returns one thing; we need a collection
+ could you write your own SQL query instead of using `where`?
  + you _could_, but don't
+ can you not get the index of the toys without a cat_id?
  + yes, the routes are structured in that way currently
+ is it convention to call it `CLASS_params`?
  + yes, it should match the model you'll be creating
+ ??
  + we need a `cat_id` because the model validates a `cat_id`
+ `find` vs. `find_by`?
  + `find_by` returns `nil` if it is unsuccessful; `find` errors if it is
  unsuccessful
    + ??
      + `find` will prevent the response from getting sent to the user
+ if the conditional was `@toy.create` instead of `@toy.save`?
  + we'll see why we use this pattern in views
+ how many different statuses are there?
  + a ton. know `200`.
+ `@toy` still exists even after we've destroyed it?
  + correct
+ `new` just renders a form?
  + correct
+ what if you put a `cat_id` that doesn't exist?
  + in this case, it would still create it, but in a realer app you would
  validate the existence of the cat
+ ??
  + we can see that `DELETE` lines up with `toys/:id` in `rake routes`
+ what should we nest?
  + `index`; sometimes `create`
+ how does `redirect_to` work?
  + use a Rails URL helper (e.g., `cats_url`)
    + how do you put in a wildcard when using a URL helper?
      + `cat_url(id)`
+ how would you make an index for all the toys?
  + set up some logic branching in the controller method
    + why isn't `render json:` in the logic branching?
      + i want to render that no matter what branch i take

---

# W4D1

## 12/5/2016

Lecturer: Shamayel Daoud

## AR Lite

+ silence

## HTML Homework

+ why do we use semantic tags? they make it easier to see what's going on and
see the structure of the page

+ why do we put it in a separate branch rather than the main branch? two ways
of setting up a github pages page

+ ?? (what are we doing with HTML?) organizing information in clusters

+ backwards compatibility with semantic divs? i think older browsers can handle
them

+ frameworks vs. coding HTML by hand? we're going to start by coding HTML by
hand

## Rails Homework

+ discussion going on in the front row about Rails views or something?

+ do views get access to controllers' variables? only instance variables

## Quiz

+ "should we go over the quiz," asks Shamayel. "yes please," responds someone
in the front row.

+ Q3: can controllers both render and redirect? no, either one provides a
response to the request.

+ Q3: controllers live for one request-response cycle? yes, Rails is stateless.

+ question about creating routes in the Rails homework gets asked during this
section, I can't hear what it is.

## Rails

+ are these slides online? yes, i will send out a link

+ is there a preferred way of popluating params? usually info is nested under a
key named after the model

+ why does the last example (with `{dog: {}}`) throw an error? because there's
no `cat` key

+ why don't we have to whitelist IDs from the url path? they're coming from a
different place and handled in a different way

## Demo

+ what does the `(.:format)` mean when you run `rake routes`? -> it lets you know that you can grab that part of the
request path and access it using the variable `format` (it's usually either
`html` or `json`)

+ is the `:id` param a string or an integer? rails handles this for you

+ where is the `:id` param coming from? the request's URL path

+ don't you have to do the `rake db:create` &c.? i already did that when i set
up the app

+ how do we get the `params` variable? it's there by default

+ can you still `render json:` local variables? yes, but it's a good habit to
use instance variables.

+ what is `:unprocessable_entity`? it's a Rails-defined variable that means a
specific status code

+ what if we wanted to redirect back to the index instead? we could use a Rails
url helper.

+ should the view matter for a redirect? it shouldn't matter

+ if we wanted an index for all toys but also an index for a cat's toys, how
would we do that? make another index action in your routes file (remember to
restart your server whenever you change your routes file!). you'd also have to
change your controller.

+ what about destroy, what do we return? usually you render the thing you just
destroyed but sometimes you redirect to somewhere else.

## 10/3/2016

Lecturer: Gage Newman

### w4d1 Welcome to Rails

* RageGage welcomes the students to rails
  - draws a diagram illustrating request / response cycle
  - students chuckle at mysterious 'internet'

* Q: what is the view?
  - RageGage: it is an html template

* Q: where do views come from?
  - RageGage: we create the views

* Q: what is the relationship between the controller and the model?
  - RageGage: the controller manages the models. examples later

* Q: in what order do we create the different pieces of a rails app?
  - RageGage: your choice -- typically write route, controller, model for each new route you want to add

* RageGage dodges an out of scope question by referring to RailsLite

### Homework recap

* RageGage describes the relationship between html/css/js
  - students are attentive

* RageGage displays a diagram from the homework to show students how elements are grouped

### ActiveRecord lite recap

* RageGage relates ActiveRecord to his whiteboard diagram

### Videos Recap

* Q: Can I have an example of a query string?
  - RageGage draws a hypothetical google maps query string on the whiteboard
  - elucidates the differences between types of requests

* Q: which part of the diagram writes to the server log?
  - RageGage: it is not in this diagram. You will see it when making rails apps

* Q: can you make it (the rails diagram) big?
  - RageGage: not sure if I can make it big
  - students call out advice on how to make it big
  - RageGage compliments the colors used on the rails diagram and enlarges the image

* Q: What is 'as cat'? (on Rails Router slide)
  - RageGage evades an out of scope question
  - Rage: we will talk about that tomorrow

* Why not use something other than id? like 'username' ?
  - RageGage: yes you can do this (describes how)

* Q: how does it know if 5 in the url is an id or a username?
  - RageGage: you set up whether the id or username is referred to


### Quiz Recap

* RageGage preempts all questions for quiz Q1 and Q2

* Q: Would a controller be coupled with another controller?
  - RageGage: I don't think controllers would be coupled together because they don't really talk to one another

* Q: render vs redirect
  - RageGage: teaches difference between render and redirect

* Q: is it possible for one controller to handle two models?
  - RageGage: possible but highly not recommended

* RageGage bemoans the sudden increase in questions
  - Students laugh...nervously?

* Q: is it a nested route?
  - RageGage: yes

* Q: could bicycles index via symbols rather than strings?
  - RageGage: My guess is probably no.
  - RageGage: look at the Rails docs for syntax questions

### HW recap

* Q: I didn't undersant redirect_to plz explain ?
  - RageGage explains redirect_to, adds to the whiteboard diagram

* Q: what role does the view have in redirect?
  - RageGage: it skips the view. it is redirected.

* Q: what about render?
  - RageGage reiterates differences between render and redirect

* Q: I am confused. (seems to have a question but I don't know what she's trying to ask)
  - RageGage: ask me after lecture

* another render vs redirect question
  - RageGage re-reiterates differences between render and redirect and how they affect which url a user sees

* Q: y would I use a redirect instead of a render ?
  - RageGage talks more about redirect and render

### API demo

* Q: why are things commented out at the top (of the demo)?
  - RageGage: it shows alternate syntax
  - Q: but does it do anything?
  - RageGage: no, it's extra info for you to read

* RageGage asks for a cat name
  - the recommended cat name is Pickles
  - Claire is delighted by Pickles the Cat

* RageGage engages the students during the demo

* RageGage renames Pickles to Snuggles
  - everyone is delighted

* RageGage makes a failed update and asks what's wrong
  - students talk amongst themselves
  - RageGage doesn't update Snuggles because Snuggles is perfect the way they are
    - The students accept this, appear to agree

* RageGage asks the students how they feel about the demo
  - one student feels a little allergic

* Q: how do you pass in a null false in the command line when creating a new model?
  - RageGage: ask me after lecture

* RageGage checks in with the students to make sure they are familiar with rake routes

* RageGage completes the demo
  - students clap and cheer quietly

* a question about how information is passed by controllers
  - RageGage explains show and index methods

* RageGage explains render json, local variables vs instance variables

* Q: what do views have access to?
  - RageGage: views have access to instance variables

* RageGage thanks the audience and releases the students from lecture

## 8/1/2016

Lecturer: Brooke Angel

## ?'s from AR
* What is the purpose of the `AssocOptions` class?
* How does `hasOneThrough` work?

## ?'s from HW
* If you create a new book, and it was titled incorrectly, how could you render
back an error telling the user such?
* Why do we use instance variables in controller methods?
* How do the views get rendered?
* What is contained in the `errors.full_messages`?  Is there a less-complete
version?

## Cat API Demo
* What is the differene between `put` and  `patch`
* How do you create routes for different controllers?  All in the `routes` file?
* Why use `bundle exec rake db:migrate` instead of `rake db:migrate`?
* Why put debugging gems in development block?
* How could we use mass assignment with params in the controller?
* How do you access nested params in controller actions?
* Why use `Cat.find_by(id: params[:id])` vs. `Cat.find(params[:id])`?
* Are their built-in methods for updating multiple toys for one cat?
* Is it bad practice to use `cat.create` in the `CatsController#create` method?

## Notes
* Zoom in on screen
