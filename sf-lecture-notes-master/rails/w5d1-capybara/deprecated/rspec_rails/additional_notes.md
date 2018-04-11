# Testing Rails Apps With Capybara and RSpec

## Warm-Up: Debugging

- [Rails Debugging Quick Reference][rails-debugging]

[rails-debugging]: ../debugging

## Overview

- We're going to use **RSpec** to test our Rails applications.
- Best practice is to write **unit tests** for models, controllers, and
  views, as well as **integration tests** for the whole application.
- The **shoulda_matchers** gem allows us to easily test models and
  validations.
- Today we'll focus on using the **capybara** gem to write integration
  tests.
- We'll use the **FactoryGirl** and **Faker** gems to seed our test
  database.

## Getting Started

Run the command `rails new app_name --skip-test-unit`. To your Gemfile,
add:

```
# Gemfile
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
end
```

Run `rails g rspec:install`. This will set up the folder structure for
your app, including `spec_helper.rb` and `rails_helper.rb` files.

Finally, you may want to update Rails' configured generators to ensure
that RSpec files are generated along with your models and controllers:

```rb
  # config/application.rb

  config.generators do |g|
    g.test_framework :rspec,
      :fixtures => true,
      :view_specs => false,
      :helper_specs => false,
      :routing_specs => false,
      :controller_specs => true,
      :request_specs => true
  end
```

## Unit Testing with Shoulda-Matchers

**NB**: We won't focus on this today, but it's good to know how. If you
get through all of the day's work, take this one as a bonus.

As always, test the public interface of your models, controllers, and
views. For most models, this will simply mean testing associations and
validations. The `shoulda-matchers` gem provides an elegant syntax for
doing so:

```rb
# user_spec.rb

describe User do
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:cats) }
end
```

Check out the [shoulda-matchers docs][shoulda-matchers] for more info.

[shoulda-matchers]: https://github.com/thoughtbot/shoulda-matchers#activemodel-matchers

If your models have other public methods, you can test those using the
RSpec syntax you're already familiar with.

## Fixtures and Factories

**Fixtures** are the default tool for testing parts of our app that
interact with the database (i.e., the models). Fixtures are read from a
`fixtures.yml` file before tests are run, and any changes are rolled
back between tests. There are a couple notable downsides to this
approach:

- Fixtures are defined in a file far away from your tests.
- Fixtures must be hard-coded, so you need separate fixtures for any
  edge cases you want to test.

**Factories** resolve these issues handily. Factories are defined inside
your `spec` directory, and the syntax for declaring factories offers a
good deal of flexibility. In particular:

- You can override attributes of a factory by passing in an attributes
  hash.
- Factories can be defined in terms of other factories.
- Associated models can also be defined in factories.

The best approach to using factories is to declare a **base factory**.
This should be initialized with only the most basic attributes required
to pass all your model validations. Using this as a starting point, you
can define factories for edge cases.

Here's a quick guide to [getting started with
FactoryGirl][factory-girl-getting-started].

**NB**: It's a great idea to use [Faker][faker] to generate random data
for your models. This way, you don't have to waste time thinking of seed
  data; it will be generated for you, and you might find an edge case.

[factory-girl-getting-started]: http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md#Defining_factories
[faker]: https://github.com/stympy/faker

## Integration Testing with Capybara

### Notes on Syntax

The idiom for Capybara is a bit different from vanilla RSpec, to reflect
that we're simulating user interaction and not unit testing methods.
Here's a quick reference:

```rb
{
  feature: describe,
  background: before,
  scenario: it,
  given: let
}
```

### Simulating User Interaction

The `capybara` gem gives us the ability to run integration tests on our
app. It accomplishes this by opening the application in a "headless
browser"-- that is, a browser without a visual display. Capybara will
simulate the sorts of actions that a user would take to interact with
our app--clicking buttons, filling out forms, and so on. This takes care
of the "setup" and "exercise" portions of our tests.

For info on the DSL, including the key methods we'll be using, refer to
this [excellent documentation][capybara-dsl].

### Writing Expectations

To complete the "verify" portion of the test, we'll need to write one or
more expectations. Once again, the syntax hasn't changed much from the
RSpec syntax you already know. The major difference is that Capybara
exposes a `page` object, which you can access inside of your tests. The
`page` object exposes several [predicate methods for
querying][capybara-querying]. Any of these can be used in an
expectation:

```rb
# page.has_content? (most common)
expect(page).to have_content("Welcome, #{user.username}!")

# page.has_selector?
expect(page).to have_selector("input.form-control")
```

Lastly, Capybara also provides the `save_and_open_page` and
`save_and_open_screenshot` methods for debugging.

[capybara-dsl]: https://github.com/jnicklas/capybara#the-dsl
[capybara-querying]: https://github.com/jnicklas/capybara#querying
