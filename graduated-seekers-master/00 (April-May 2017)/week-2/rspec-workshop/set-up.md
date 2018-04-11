# Setting Up RSpec with Ruby on Rails

## Overview

RSpec is a tool for testing Ruby applications, and is often used to test
Rails apps. Set-up will include the following steps.

* Add RSpec and other useful gems to your Gemfile, and install with
 Bundler
* Set up a test database, if necessary
* Configure RSpec
* Configure the Rails Application to generate test files automatically
  as features are added

## Adding RSpec Gems
At this point, you should already have a group of development and test gems set up like this in your Gemfile:
```ruby
group :development, :test do
  gem 'pry-rails'
  gem 'byebug'
  gem 'spring'
end
```
Add the following Gems to the `group :development, :test` **in addition to** the existing Gems:

```ruby
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
```

Then, add the following to your Gemfile:

```ruby
group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end
```

Next run bundle from the command line to install the gems:
``
$ bundle install
``

You now have the necessary gems.

## The Test Database

Open up `config/database.yml`.  Since we are using Postgres, it should look like this:

```ruby
default: &default
  adapter: postgresql
  encoding: utf8
  pool: 5
  timeout: 5000
  database: bench_bnb_development

development:
  <<: *default
  database: bench_bnb_development

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: bench_bnb_test

production:
  <<: *default
  database: bench_bnb_production

```

Notice there are three sets of configuration data: one for
`development`, one for `test`, and one for `production`. When you are
running a server on localhost, Rails is using the `development`
database. For running tests, it will use a separate `test` database. The
default configuration will work just fine for testing with RSpec.

Make sure Postgres is running on your machine, and then run `rake db:create` on the command line to create your development and test databases.

Then, since we'll be working with the test database, go ahead and also run `rake db:migrate RAILS_ENV=test` to run the migrations for your test database.

Later, if you'd like to test what exists in your test database, you could also run `RAILS_ENV=test bundle exec rails console`.

## Configure RSpec

Next, install RSpec by entering the following on the command line:

```
$ rails g rspec:install
```
A successful install will output the following message:
```
    create  .rspec
    create  spec
    create  spec/spec_helper.rb
    create  spec/rails_helper.rb
```

You also might get the following message:
```
An Array ({"GEM_PATH"=>["/Users/josh/.rvm/gems/ruby-2.3.1", "/Users/username/.rvm/gems/ruby-2.3.1@global"]}) was passed in from bin/rails:3:in `load'
```
You can ignore this for now. It's an issue with some of the Gem versions, but won't actually cause us any problems here.

We want to tweak the default RSpec configuration so that it will format
its output in a readable way. To do this, make your `.rspec`
configuration file look like this:

```
--color
--require spec_helper
--format documentation
```
If you are interested in customizing RSpec further, check out
[the documentation here][rspec-doc].

[rspec-doc]: http://rubydoc.info/github/rspec/rspec-core/RSpec/Core/Configuration

## Auto-Generate Test Files

Lastly, we will configure Rails to auto-generate starter files to test
with RSpec, rather than the using the default TestUnit included in
Rails. With this configuration, model specs and controller specs will automatically be generated in the `spec` directory when you `rails g model ...` or `rails g controller ...`.

I imagine that most of you at this point probably won't be adding new models or controllers to your FSP, but let's go ahead and set this up as good practice for future projects.

Open `config/application.rb` and add the following code inside the
Application class:

```ruby
# my_app/config/application.rb

config.generators do |g|
  g.test_framework :rspec,
    :fixtures => false,
    :view_specs => false,
    :helper_specs => false,
    :routing_specs => false,
    :controller_specs => true,
    :request_specs => false
end
```
You can probably guess what these settings do:

 * `g.test_framework :rspec` tells Rails to use RSpec for testing.

 * `:fixtures => false` means Rails should not generate fixtures for
 each model. (Fixtures are the default Rails way of creating sample data
 for tests.)

 *  `xxxxx_specs => false` means that we won't auto-generate spec files
for views, helpers, routes, or requests.

Today, we will just focus on writing model and controller tests. As you become more comfortable testing, you may want to change these settings and use tests for the other components, too.

Now, let's move on to the next step, [writing model tests][model-tests]!

[model-tests]: ./model-tests.md

## Additional Resources
 * [RSpec homepage][rspec-home]
 * [RailsGuides: Testing][rails-guides-testing]
 * [RailsGuides: Configuring Generators][generators]

[rspec-home]: http://rspec.info/
[rails-guides-testing]: http://guides.rubyonrails.org/testing.html
[generators]: http://guides.rubyonrails.org/configuring.html#configuring-generators
