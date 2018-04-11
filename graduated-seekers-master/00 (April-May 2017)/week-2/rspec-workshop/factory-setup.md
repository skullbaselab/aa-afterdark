# Setting up FactoryGirl factories

## Motivation

In our User model test, we needed to create instances of our models in order to test them. Right now, we're doing something like:

```ruby
# BAD
User.create!(username: 'breakfast', password: 'password')
```
In our model test, it actually worked out nicely, and we only needed to make one specific user instance for our entire User model test. However, when we move to writing User controller tests, it's slightly tedious to have to keep writing out the usernames and password for each user instance that we want to create and test.

In addition, we want to avoid having all of that clutter in our test code
each time we need to work with a user for testing purposes. One solution
to this problem is Rails's built-in fixtures, but they have [some
downsides][factories-bad] of their own.

## FactoryGirl

The best solution is to use factories. **FactoryGirl** is [the top
library][factories-good] for replacing fixtures. It allows us to write:

[factories-bad]: https://semaphoreapp.com/blog/2014/01/14/rails-testing-antipatterns-fixtures-and-factories.html
[factories-good]: https://www.ruby-toolbox.com/categories/rails_fixture_replacement

```ruby
# GOOD
let(:user) { FactoryGirl.create(:user) }
```

The user object will be created using default values for its attributes,
which are defined by a factory like so:

```ruby
# benchbnb/spec/factories/users.rb

FactoryGirl.define do
  factory :user do # The name matters. :user factory returns a User object.
    name 'breakfast'
    password 'password'
  end
end
```

These default values can be selectively overridden:

```ruby
let(:another_user) { FactoryGirl.create(:user), name: "curie" }
# another_user.name => "curie"
# another_user.password => "password"
# ^of course you can't actually call on the user's password.
# This was done just to show that the default password of "password"
# is still being generated from the User factory, while the Factory's
# default name of "breakfast" has now been overriden by "curie".
```
With our current User factory settings, every single factory-generated instance of our user, would have a username of 'breakfast'. If we wanted to vary it up, we could also use the [faker gem][faker]. We won't actually be needing that for this project, but feel free to read through the reading and set up Faker for testing your own FSP.

[faker]: https://github.com/appacademy/curriculum/blob/master/rails/readings/factorygirl-and-faker.md#faker

## Setting Up FactoryGirl
Your Gemfile should already have the `factory_girl_rails` Gem under development and test.

If you'd like for a factory to be generated along with the spec file whenever you do future 'rails generate model' commands, add the following line at the end of your `config.generators` block inside of the `config/application.rb` file:

```ruby
  g.fixture_replacement :factory_girl, :dir => "spec/factories"
```

You should now have the following in your `config/application.rb` file:

```ruby
config.generators do |g|
  g.test_framework :rspec,
    :fixtures => true,
    :view_specs => false,
    :helper_specs => false,
    :routing_specs => false,
    :controller_specs => true,
    :request_specs => false
  g.fixture_replacement :factory_girl, :dir => "spec/factories"
end
```

Lastly, if you don't want to need to prefix each FactoryGirl method call
with `FactoryGirl`, add `config.include FactoryGirl::Syntax::Methods` in
your `rails_helper.rb` file:

```ruby
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
```
Doing the above configuration now allows us to write:
```ruby
let (:user) { create(:user) }
```

rather than

```ruby
let(:user) { FactoryGirl.create(:user) }
```

## Using FactoryGirl

### Setting up Factories

When we previously ran `rails g rspec:model User`, it should have invoked FactoryGirl and created the associated User factory. If it didn't do that for some reason, create the directory `benchbnb/spec/factories` and define each factory in a separate file. (`benchbnb/spec/factories/user.rb`).

For now, let's go ahead and fill in our user factory with default attributes of:
* `username` is "breakfast"
* `password` is "password"

Go back to your User model test, replace the direct call `User.create!` with the FactoryGirl create method instead.

Run your model specs to make sure everything is still working.

Next, we're going to skip over writing tests for the User controller, and instead write tests for the Benches controller. To prepare us for the Benches controller tests, go ahead and manually set up the benches factory:
* In `spec/factories`, create `benches.rb`.
* Copy and paste the following template:

```ruby
FactoryGirl.define do
  factory :bench do
    # complete the rest of factory
  end
end
```
Make sure to refer to the schema and the Bench model to ensure that you've defined all of the necessary attributes.

Although we're done with factories for now, I highly encourage you to later go back to the [factories reading][factory] reading from the main curriculum, which goes into much more depth about how to use FactoryGirl. This can definitely be beneficial for you as you write more in-depth tests for your own FSP.

[factory]: https://github.com/appacademy/curriculum/blob/master/rails/readings/factorygirl-and-faker.md#using-factorygirl-and-faker

Once you're done with factories, let's move on to the last step, [controllers!][controller-tests]

[controller-tests]: ./controller-tests.md
