# Auth

---

## Agenda
  * Whiteboard Overview (10 min)
  * Demo (60 min)
  * Questions (20 min)
  * Quiz (5 min)
  * Open Forum

---

# Demo

---

## Steps to Add Auth:
  * Add BCrypt gem
  * Update User table
  * Update User Model
  * Add User and Session Routes
  * Update Application Controller  
  * Update Users Controller
  * Create Sessions Controller

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
  * #valid_password?(password)
  * #ensure_session_token
  * #reset_session_token
  * User.find_by_credentials(username, password)

---

## User and Session Routes
* users#new, users#create
* sessions#new, sessions#create, sessions#destroy

---


## Application Controller
  * #login!
  * #logout!
  * #current_user
  * #require_logged_out
  * #require_logged_in

---

## Users Controller
  * Add :password to allowed #user_params
  * login!(@user) when a new user is created
  * flash errors and re-render :new

---

## Sessions Controller
  * #new
  * #create (for logging in)
  * #destroy (for logging out)
  * Add routes

---

## Forms
  * Add password field
  * Add CSRF token

---

# Questions

---

## Quiz Solutions

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/rails/w4d4.md)

---

## Open Forum

---

## Homework Solutions

+ [HTML](http://appacademy.github.io/curriculum/head_section_example_recipe.html)
+ [Auth](https://github.com/appacademy/curriculum/tree/master/rails/homeworks/rails-auth)
  + [User Migration](https://github.com/appacademy/curriculum/blob/master/rails/homeworks/rails-auth/solution/db/migrate/20160530171354_create_users.rb)
  + [User Model](https://github.com/appacademy/curriculum/blob/master/rails/homeworks/rails-auth/solution/app/models/user.rb)

Note:
mention bcrypt docs (https://github.com/codahale/bcrypt-ruby)

---
