# Partials / View Helpers / Mailers Demo Steps

The below demo notes are provided for instructors, but can be referenced by students if needed. 

* CSRF!
- Basic CSRF explanation

* Partials 
- Refactor comments into partial
   - NB -- when you move to render just the colleciton, NEED 'partial:' syntax. However to use the non-locals shorthand, CAN'T do this
   - For comments, start with longhand collection, as: then make smaller
- Refactor errors into own partial, pass object

* View Helpers
- link_to / button_to, time_ago_in_words, google ActionView::Helper
- Show current_user
- Example for special formatting
- Write rails_auth_token
  - Start without htmlsafe
  - Then add, and switch to heredoc
  - Warn about finnickyness with quotes
- Talk briefly about yield, provide, and content_for [:head] and yield :head

* Mailer
- Talk about ActionMailer. Lots of steps, but not complicated. 
- g mailer
- show layouts -- we could modify these if we wanted
- add default from address -- admin@blogger.com
- define 'article_created' email, which takes user and post as arg
  - set an instance variable we can use in the view. @name = user.name, or @user = user. @article as well
  - end with: mail(to: user.email, subject: '')
- Write the view, including both .html and .text
- Go to controller to actually write the logic for sending this
  - Explain that mail doesn't send a message, just returns an object wrapping the e-mail
- Call Notification.article_created

* Mailer Continued
- Test! No e-mail gets sent. Let's look at the server logs.
- Time to install letter_opener. RESTART THE SERVER. Any time you make changes to config
- config.action_mailer.delivery_method = :letter_opener (dev)
- Demo this, then add link_to with URL helper but don't set host.
- Now set host in default_url_options = { host: '..'} and show off working link

* Extra
- Show attachments. test_image.png on Desktop. 
- To actually send e-mails: set delivery_method to SMTP. provide .smtp_settings settings.
- AciveJob (so not on post), MailGun
=======
 # Auth

  ---

  ## Agenda
    * Demo (60 min)
    * Questions from Demo (15 min)
    * Quiz (5 min)
    * Questions from yesterday's Project/HW

  ---

  # Demo

  ---

  ## Steps to Add Auth:
  * Add BCrypt gem
  * Update User table
  * Update User Model
* Update Application Controller
* Create Sessions Controller
* Update User Controller

---

## User Migration
  * Add password_digest and session_token
  * Add indexes on session_token

---

## User Model
  * Validations
    * password_digest, session_token
    * password: length, allow_nil

---

## User Model
  * #password=(password)
  * #is_password?(password)
  * #ensure_session_token
  * #reset_session_token
  * User.find_by_credentials(username, password)

---

## Application Controller
  * #login!
  * #logout!
  * #current_user
  * #require_logged_out
  * #require_logged_in

---

## Sessions Controller
  * #new
  * #create (for logging in)
  * #destroy (for logging out)
  * Add routes

---

## User Controller
  * Add :password to allowed #user_params
  * login!(@user) when a new user is created
  * flash errors and re-render :new

---

## Forms
* Add password field
* Add CSRF token

---

# Questions

---

## Quiz Solutions

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/rails/w4d3.md)

---

## End

---

## Homework Solutions

+ [HTML](http://appacademy.github.io/curriculum/head_section_example_recipe.html)
+ [Auth](https://github.com/appacademy/curriculum/tree/master/rails/homeworks/rails-auth)
    + [User Migration](https://github.com/appacademy/curriculum/blob/master/rails/homeworks/rails-auth/solution/db/migrate/20160530171354_create_users.rb)
    + [User Model](https://github.com/appacademy/curriculum/blob/master/rails/homeworks/rails-auth/solution/app/models/user.rb)

Note:
mention bcrypt docs (https://github.com/codahale/bcrypt-ruby)

---

/auth
