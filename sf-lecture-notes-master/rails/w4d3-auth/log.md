# 1/4/18

Lecturer: Anastassia
Scribe: Jesse

+ can you add db level validations after the fact
  + would need to start over again, because if there was old data that didn't satisfy the new validations, that would cause an issue
+ can you add an index after the fact?
# will double checks
+ does BCrypt::Password.create('secret') result in different hashes?
  + yes, the BCrypt salting and check sum are different even with the same password input value
+ why do we put BCrypt::Password.methods(false)?
  + because otherwise we'd get all of the inherited methods also
+ why does it matter that we use urlsafe_base64?
  + it is part of how secure random works
+ can you access the methods through the instance variable in our views?
  + if the instance variable has been sent up in the appropriate controller action then yes, otherwise no


# 10/26/17

Lecturer: Anastassia
Scribe: David

* So the session token is updated in the database every time a user is logged in?

* Some websites keep you logged in when you close the browsers, others don't. What's the deal?

* How do we know what the salt is for any particular user?

* What does the binding_of_caller `gem` do?

* Why don't we index the `password_digest` column in our `users` table?

* We encrypt our password when we store them in the database, yet we just store them as plain text in instance variables in the controller. What's the deal?

* Can you explain how the BCrypt methods work?

* When we called `User.new` we got handed in a `username` and a `password` and got back a `username` and a `password_digest`, how did that happen?

* Won't `allow_nil` let users type in blank passwords?

* How does rails know to call the `password=` when you have the key `password` in the options hash provided to `User.new`.

* I don't understand `User#valid_password?`.

* So when you log out, you don't delete the session token in the database, you just replace it?

* How do we handle different users logging in at the same time?

* So does each user have their own session?

* What's the difference between after_initialize and before_validation? Are their use cases identical?

* If our database gets compromised and they can see all of the users session tokens, can't they then impersonate the user?

* What is `!!current_user`; am I reading that correctly?

* Why not just return `current_user` from `logged_in?`?

* Why do we use the `current_user` method instead of just accessing `@current_user`?

* What if you only want `before_action` to be invoked before specific actions?

* So you've used both `flash` and `flash.now`. Are they totally interchangeable?

* Why don't we use strong params in the session controller?

* Is the form_authenticity_token a default rails method?

* When do we include the form_authenticity_token?

# 4/19/17

Lecturer: Gage Newman

## Yesterday's Solutions (99 Cats Part I)

* When we're writing the `new` action, we create a `Cat.new`. Why?
* Overlapping CatRentalRequests
  + Comments in solution give someone who's looking at it an idea of what's
  happening.
* In overlapping CatRentalRequests, why doesn't it use the question marks that
we usually see? What's happening? Is it sanitizing, even though it isn't using
question marks?
* What are member routes?
  + member routes, collection routes
* Are member routes just appending extra routes?
  + Yes, they're appending non-restful routes

## Reading

* Is it possible to have a `password_digest` even if they have a blank password?
  + Validations would prevent this from happening.
* Why do we want to set `@password = password` in `password=(password)`? Is that
a security risk?   
  + Instance variables only last one request response cycle.
* Why do we set `@password` at all?
* When do the validations get run? What's the difference between
`after_initialize` and `before_validation`?
* Once we create a new user, what triggers password= to run?
  + You'll find out on Rails Lite Day!
* Is there any security risk in having an `attr_reader` for `password`?
  + Not really. `@password` is only readable in our server in the middle of our
  request. If someone has access to our server at that point, we   have bigger
  problems.     
* Can passwords show up in the server log because they are a parameter being
passed?
  + By default, yes, but Rails...does something.
* Question about cookies.
  + Brief description of what cookies are.
* Are cookies related to incognito mode?
  + You can manually clear all your cookies
* How is a session related to a cookie? Are they a tamper-proof cookie?
  + A session is a slightly abstracted version of a cookie. They're sort of a
  tamper-proof cookie.
* Are cookies related to auto-completing? Or saving credit card information?
* How long do cookies live?
* Every time someone logs in, do we have to search through millions and millions
of users?
  + Yes, but we made it easy
* How do we handle different sessions for the same user coming from different
computers?
  + Thats the bonus for one of the projects. You'll find out then.
* Where is `ensure_session_token` being called?
  + `after_initialize`
* Is this the standard way to do auth? Or are there multiple ways to do it?
  + This is the most common. There are others. This pattern still works in a
  non-Rails setting.

## Auth Demo

* `<input>` type `submit` makes a submit button, and type `password` obscures
the password?? Cool.
* Does Firefox have an equivalent to Chrome DevTools?
  + Yes, but I recommend Chrome.
* How do you decide when to use `flash` vs `flash.now`?
  + `flash` lives for one subsequent request while `flash.now` does right after
  the request gets sent back. User `flash` when you   `redirect`, user
  `flash.now`   when you `render`.   
* After saving the user, why do we `redirect_to` the `user_url` rather than
`new_user_url`?
* When do we `redirect_to` instead of `render`?
  + You should `redirect` if you want the url to change
* Question about how redirects work
  + Explanation of status codes
* Question about `current_user`
  + We have access to `helper_methods` in our views as well as our controllers.
* Are helper_methods like global methods?
* What's the deal with `application.html.erb`?
* Why do we user `||=` in our `current_user` method?
* Does the `if current_user` line in `application.html.erb` make a query to the
database every time we load the page?
* How are users and session tokens associated?
* What happens if we have duplicate session tokens?
* Is `session_token` the same as `authenticity_token`?
  + No.
* Does the browser store the session token for the app?
  + Yes, you can see them somewhere in DevTools.
* Where in our code are we storing session_token in the browser?
  + `session[session_token] = user.session_token`
* What keeps someone from generating session tokens until they're logged in as
someone?
  + Mathematical probability
* Is session like a hash of cookies?
  + Yes sort of. It has a key-value pair thing going on.
* Is there a time when logging in as multiple users causes a problem?
  + There's only one session token being stored at a time. Logging in as
  person5 logs out person4 because the session token gets replaced.
* Do you have to pass the user to the session_url when logging out?
  + change `resources` to `resource`
* What about FB login, Google login, etc.
  + Oauth
* `session` isn't a variable we define, it's something Rails does to access the
cookie?
  + Yes.
* When a person logs in, the session token is in two places, the browser, and
the database?
* Rails does so much for us. Why don't they put authenticity_tokens in our forms
for us?
* Who named it cookies?
  + Stuff from the ancient days of the internet has weird names
* How do you open DevTools?

## Feedback
- Kind of hard to hear. Why did you stop using the mic??
- I like that you break down everything step-by-step and ask questions as you
work.
- Lots of confusion about session and session_token
- Also great that you go over debugging strategies at the end

# 2/15/2017

## Gage does Auth!
Notes by Jenn Georgevich

## Reviewing the Auth HW ~10am

- does after_initialize run after User.new?
- is there a way to use ActiveRecord methods to make "for" relationships / queries
- is there an "or" built into ActiveRecord ?
  - a student explains his solution to this
- a question about lazy evaluation and when a query actually hits the database
- when does validation happen?
- does 'update' check validation?
  - a student shares his experience of not knowing whether 'update' checks the validation
- a question about controller scope: do controllers have access to models they don't share a name with? (like the Cat controller accessing CatRentalRequests)
- why do we need attr_reader: password ?
- what is the point of accessing the password at all?
  - for validations
- what is BCrypt.new doing? how does find_by_credentials work?
- didn't Haseeb say to not roll our own auth?
- when is the validation for the password actually run?
- is the HTTP stuff we learned invalidated by HTTPS?

## Reviewing the HTML HW 10:30am
- Teach me HTML shortcuts in atom
- Teach me erb shortcuts in atom

## Demo 10:34am
- why does self.session_token work but not @session_token?
- how might we log people out after a period of inactivity / being logged in for a long time?
- what does rolling your own authentication mean?
- what would happen if two users had the same password_digest?
- is it necessary to validate uniqueness on session_token?
- a student shares his opinion on password_digest collisions
- what is a password_digest?
- why put all this in ApplicationController instead of UserController or SessionController ?

### Gage draws a cookie on the board, explains session
- how does flash work?

- if a user logs in again, will they get a new session_token?
- what is Session? is it like a model class? what goes into it?

### Gage explains redirects
### Break 11-11:05am

- how will we see the errors in a controller? (save vs save!)
- flash vs flash.now ?
- would we have to read from the flash object's error key somewhere in our view?

- SessionsController: why do you parse out params[:user][:name] and params[:user][:password] instead of passing in params[:user] ?

- what is flash?
- what about multiple login on different devices?
- during testing login in the browser: who were you signing up as? (a new user)
- where is the authenticity token coming from?
- what if we gave the form a 5 letter long password?
- where is the error message coming from? (which partial?)
- a question about redirect vs render and flash vs flash.now
- is "shared/errors" in application.html.erb rendered from ApplicationController ?
- can you have partials that are rendered on every page ? or by different controllers ?
- how are the answers to security questions stored?

### Quiz Review 11:45am

## 10/07/2016
Lecturer: Ryan Hall

### Questions from 99 Cats

  * When do you need quotes in the html.erb files?
  * What's in scope in the erb tags?
  * How do the url helper methods for actions work?
  * How do you change the prefix for routes?
  * Who is the hidden tag hidden from?

### Questions about Homework

  * Questions about setting the password_digest

### Questions from Lecture

  * What happens if we set the same keys for `flash` and `flash.now`?
  * Are flash and session hashes or hash-like objects?
  * Is there a structural relationship between `flash` and `flash.now`?
  * What information lives in cookies?
  * What happens to the session token when the user logs out?
  * Stealing cookies?
  * Will we have to install `BCrypt` manually on the exam?
  * When validating passwords, if we `allow_nil`, what happens if a new user doesn't put in a password?
  * When a person logs in, do they keep the same `session_token` as before?
  * What's the difference between `save` and `save!`?
  * Why is session singular?

### Other Notes
  * typo in homework solutions `find_by_credentials` class method. Should be `user.password_digest` instead of `password_digest`




## 08/03/16
Lecturer: Ryan Hall


### Questions from 99 Cats

  * What are member routes?

### Questions from lecture

  * Why are cookies unsafe?
  * What's the difference between `BCrypt::Password.new` and `BCrypt::Password.create`?
  * Why do we use `||=` in `ensure_session_token`? (when does a model get instantiated?)
  * How does `allow_nil: true` affect things if the user didn't enter a password on the form?
  * Is the `password_digest` in the database a BCrypt object or a string?
  * Are controller instance variables available when you redirect?
  * Why is `login` written in the application controller instead of the session/user controller?
  * Redirect vs render, esp. with the difference between `flash` and `flash.now`
  * why are `flash.now` errors still accessible from `flash`?

## 10/05/16
Lecturer: Ryan Hall


## Questions/Comments from yesterday's assignments
  * Why do partials start with an underscore?
  * Can you clarify why we use hidden input tag when making post requests?

## Questions/Comments on Quiz
  * Aren't cookies sandboxed by other websites?
  * Is flash.now technically a cookie?
  * How do you access flash.now messages?
  * What is a form authenticity token?

## Questions/Comments from lecture
  * Where does password go after user logs in?
  * When you save password to database and you create a BCrypt object, how does database convert that to string before persisting it to database?
  * How do you handle errors when users log in?
  * How long do you stay logged in after you leave site?
  * Is errors an empty array when unfilled?

## Other Observations
  * Students asked for demo to be sent out
