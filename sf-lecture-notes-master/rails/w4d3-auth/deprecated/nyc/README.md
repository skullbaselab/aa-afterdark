[June cohort:  Leen](./previous_lectures/june2016)  
[Aug cohort:  Daniel](https://github.com/appacademy/twitter-august2016/tree/w4d3)

[Slides Dec 2016: Oscar](./previous_lectures/auth_slides_jan_2017.html)  

## Solutions prep

**Expect questions on:**
+ Transaction of approving a cat rental request
+ Overlapping request logic

**Point out:**
+ Member routes approve and deny. Writing these routes on member makes the URL include an :id


## Lecture

**1) Cookies**
+ Since HTTP is stateless, we can't preserve information between requests. Solution: cookies! A cookie is a piece of information that the server sends to the client and the client stores. This cookie will be sent back to the server with every single request
+ `get_cookie` and `set_cookie`
  + Use`cookies` method
    + Show cookie under Chrome Devtools Application tab
    + Show `set-cookie` in response headers and `cookie` in every subsequent request header
    + Optional: change to `cookies.signed` to show encypted version
  + `session` method
    + encrypts
    + sets default expiration to the session
    + Collects key/value pairs into one big cookie
+ `set_flash`
  + flash vs flash.now
    + flash.now information isn't ever making it to a cookie! But it's nice to access  information via the `flash` object from either this request OR the last one. Particularly nice for errors/alerts
    + flash before a `redirect`, `flash.now` before a render
  + Make sure to do a `redirect` instead of making two separate requests because Chrome will also make a request for the favicon!
+ Using cookies in real life!
  + Change existing controllers to use `flash[:errors]` and render them in the `application` layout. Remove old error handling from views!
  + Add form_authenticity_token to forms and protect from CSRF


**2) Auth**
+ Motivation
+ Coat Check analogy: You coat check token doesn't mean anything to you, but when you give it to the coat check, they use it to find the right coat. The token in your session cookie doesn't mean anything to you, but you use it to get the right information from the server.

**3) User Model**
+ Use the HW solution in the User model and ask for questions
+ BCrypt instance, difference btwen #new and #create
  + Make from a password with #create
  + Saved to database as a string (No psql 'bcrypt' column type)
  + Make from a password_digest string with #new
  + Compare with a given password with #is_password?
+ _Point out #save in #reset_session_token! VERY difficult bug to find_
+ #password
  + #password= is called when we call User.new(password: "starwars")
  + We need the reader #password so that we can validate it.

**4) Auth**
+ Routes: `resource :session`
  + Slightly different routes because it is a singular resource, no :id
+ sessions_controller (pre fill what you can):
  + new
  + create
  + destroy
+ application_controller
  + login
  + logout
  + current_user
  + logged_in? (optional)
+ Write header in `application` layout to show either
  + current user name and logout button
  + login link
+ Protect existing controllers!
  + `before_action` callback
  + `current_user.tweets.create`
