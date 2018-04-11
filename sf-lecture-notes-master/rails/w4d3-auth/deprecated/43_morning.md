# Content
## Controllers and State
* session is a storage mechanism
* cookies.permanent[:session_token] = session_token

## CSRF and Forms
* form_authenticity_token

## Cookies
* key value pair

## displaying validation errors, flash
* flash vs flash.now

Data stored in flash will be available to the next controller action and can be used when redirecting.

Data stored in flash.now will only be available in the view currently being rendered by the render method.


## Auth I: Creating Users
* dont store passwords in plain text in the DB
* hash is a one way function
* demo BCrypt:

```ruby
require 'bcrypt'
password_hash = BCrypt::Password.create("my_secret_password")
password_hash.is_password?("my_secret_password")
```
* `User`
  * `username`
  * `password_digest`
  * `password` setup `password=`
  * password validation stuff (validates length)


## Auth II: Sessions
* `SessionsController` clarify that session hash is NOT related to SessionsController
  * resource :session (users have at most one session)
  * no table needed
  * add session_token to user
  * `current_user`
  * add before_filter for `require_current_user!`

# Projects
* 99Cats2
  * demo auth

## Gotchas
*  "ActionMailer.   What does a successful email look like? Where does it go? Server logs? inbox? Also, are we expected to send emails when our app is just running locally? There must be a protocol or setup that must be done (and wasn't specified), so that we can actually send welcome emails to users who signed up."  (Using letteropener?)

*  TODO: put example of successful email on github repo.

*  Objects vs. locals in partials. Forgetting to use <%= to render a partial and instead using <%.
