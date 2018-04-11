
# W5D1

---

![happy-monday](https://media.giphy.com/media/H6JLWp6x8Cnio/giphy.gif)

---

![happy-real-monday](https://media.giphy.com/media/pMsekNj5it04M/giphy.gif)

---

### Tips on A04

+ The magic number is 8
+ Aim for under 1 hour

---

## Agenda

1. Today's Material
1. Quiz Solutions
1. Open Forum
  + A04P
  + Homework
  + Yesterday's Project

---

### Learning Goals

1. reinforce understanding of testing pyramid and TDD
1. understand what and how to test Rails models
1. understand what and how to test Rails controllers
1. become familiar with Capybara

---

## Brief Overview

---

### Motivations

1. Checks if it works
1. Increase flexibility / reduce fear of change
1. Very conducive to collaboration
1. Produce documentation

---

### Testing Pyramid

1. Unit Tests: each individual unit works correctly (model testing)
1. Integration Tests: test that parts of your application work together (controller testing)
1. End-to-End Tests: integration tests on a bigger scale that test user experience

---

### TDD

1. RED - run the tests after writing them
  + screens for instances of false positives
1. GREEN - write minimum amount of code to pass tests
1. Refactor - make sure its up to par with your company's style guide

---

### Rails Testing - the Checklist

---

### Basic Setup

+ add RSpec and other testing gems to Gemfile and `bundle install` / `bundle`
+ set up a test database, if necessary
+ configure RSpec (.rspec + config/application.rb)
+ `rails generate rspec:install`

---

### Testing Models

+ validations
+ associations
+ class methods
+ error messages

---

### Shoulda Matchers

+ easier to read
+ cleaner error messages
+ `gem install shoulda-matchers`
+ requires configuration (rails_helper.rb)

---

### FactoryBot and Faker

+ FactoryBot: factory method for test subjects
  + requires configuration (config/application.rb)
+ Faker: generates random instances of various data
  + try the Chuck Norris one, I dare you

Note:

I walked through the setup + coding of a basic `user` factory

---

# Example

Note:
Walk through the models of A04P (not necessarily all, but enough to
  get the point across)

---

### Testing Controllers

+ status codes and responses in various conditions
+ valid and invalid params

---

### RSpec Rails API

+ Navigation
  + get
  + post
  + patch
  + delete
+ Assertions
  + render_template
  + redirect_to
  + have_http_status, be_success

---

### Navigation Syntax

(http request) :(controller action), (params)

```ruby
get :new, link: {}
```

---

# Example

Note:
Walk through the code for the controller specs, pointing out
how formulaic everything is according to the navigation syntax

---

![corgi-relax](https://media.giphy.com/media/7Y66VN3rtkPtu/giphy.gif)

---

![capybara](https://media.giphy.com/media/hi2kPofVMW70k/giphy.gif)

---

### Capybara

+ testing library that simulates how a real user would interact with app
+ can be **headless**: no browser
  + Capybara can present browser when necessary (save_and_open_page)
+ **thought experiment**

Note:

Make sure to stress how important and useful this part of the lecture is,
especially considering the percentage of tests on A04 that are
Capybara tests

---

### API

+ Navigation
  + visit
  + click_on
+ Forms
  + fill_in "field", with: "value"
  + choose, check, uncheck
  + select "option", from: "select box"
+ Assertions
  + have_content
  + current_path
  + page
+ Debugging
  + save_and_open_page

---

# Example

Note:
Walk through feature specs

---

# Quiz

[Solutions](https://github.com/appacademy/daily-quiz/blob/master/rails/w5d1.md)

---

# Open Forum

---

# A04P

Note:

Really just Q&A for A04P

---

# Homework

[Solutions](https://github.com/appacademy/curriculum/tree/master/rails/homeworks/capybara)

---

### Yesterday's Project

[W4D5](https://github.com/appacademy/curriculum/tree/master/rails/projects/music_app/solution)

---
