# Testing Models with Rspec

## Overview

We test models in Rails to make sure that:

*  The models still work after we change their methods
*  Validations work
*  Associations are set up
*  We get appropriate error messages

Model testing in Rails is an example of unit testing - that is, testing
the various components of our application in relative isolation - as
opposed to integration testing which will test features that use many
pieces of the application.

Model specs live in spec/models.

## Creating the spec files

Let's start by writing a specs for the User model. To generate that spec file, run `rails generate rspec:model User`. This should do the following:

```
create  spec/models/user_spec.rb
invoke  factory_girl
create  spec/factories/users.rb
```

Basically, it went ahead and created a `model` directory in your `spec` directory, which holds all of your model tests. Then, it generated the specific `user_spec.rb` test.

Then, it also invoked the `factory_girl` gem and created an associated factory for users. We'll come back and talk more about FactoryGirl later.

Later, to execute that specific file instead of all of the specs, you can run `rspec spec/models/{model_name}_spec.rb` in the command line.

## Validation tests

We can test if a model is valid by using its own `#valid?` method:

```ruby
describe BasketballTeam do
  # The following incomplete_team is missing the 'name' field.
  let(:incomplete_team) { BasketballTeam.new(city: "New York") }

  it "validates presence of name" do
    expect(incomplete_team).not_to be_valid
  end
end
```

However, this process can become tedious if you have many different things that need to be validated. Luckily, there's a solution for that.

## Validation and association tests

The `shoulda-matchers` gem gives us a lot of nice one-liner expressions to test common cases.

Make sure it's in your Gemfile and run `bundle install`.

```ruby
#Gemfile

group :test do
  gem "shoulda-matchers"
end
```

Depending on which version of Rails you are using, you might need to add the following lines in your `rails_helper.rb` (at the bottom outside of the `RSpec.configute` block) in order for the shoulda-matchers methods to be available in our tests.

```ruby
#rails_helper.rb

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```
In our current case with BenchBnB, which uses Rails 4.2.0, we will need to add the above lines to our `rails_helper.rb` file.

HOWEVER, if later on, when you run your tests, and you get an error similar to:
```
undefined method `configure' for Shoulda::Matchers:Module (NoMethodError)
```
Then remove that `Shoulda::Matchers.configure` block from your `rails_helpr.rb`, and try running your tests again.

Now testing validations and other model
methods are a breeze.

```ruby
describe BasketballTeam do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should ensure_inclusion_of(:name).in_array(["Cavaliers", "Suns", "Mavericks"])} #etc..
end
```

We can also test associations!

```ruby
describe BasketballTeam do
  describe "associations" do
    # "it" refers to an instance of the BasketballTeam class here
    # because we have not explicitly specified a subject
    it { should have_many(:basketball_players)}
    it { should have_one(:owner)}
  end
end
```

## Writing Validation and Association Tests for BenchBnb User model

Now that you've read through a couple of validation and association tests, go ahead copy and paste the following template into your user model spec file and fill it out with tests for all of the validations and associations in BenchBnB's `User` model:

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # validation tests go here
  end

  describe 'associations' do
    # association tests go here
  end
end
```
For some of the validation tests that we're not as familiar with (ie. validation of length), refer to the [shoulda-matchers docs][shoulda-matchers].


**Don't read ahead until you've tried to add the validations and associations! If you get stuck for a while though, then keep reading ahead.**

### Potential Validation Issues
You probably ran into some trouble writing the uniqueness validation for `:username`. You might have gotten an error message that looks something like this:

```
Shoulda::Matchers::ActiveRecord::ValidateUniquenessOfMatcher::ExistingRecordInvalid:
       validate_uniqueness_of works by matching a new record against an
       existing record. If there is no existing record, it will create one
       using the record you provide.

       While doing this, the following error was raised:

         PG::NotNullViolation: ERROR:  null value in column "username" violates not-null constraint

```

Let's check the [validate_uniqueness_of shoulda-matchers docs][uniqueness-docs] to figure out what's happening here:

```
HOW THIS VALIDATION WORKS:
The `validate_uniqueness_of` matcher tests usage of the
`validates_uniqueness_of` validation. It first checks for
an existing instance of your model in the database, creating
one if necessary. It then takes a new instance of that model and
asserts that it fails validation if the attribute or attributes you've
specified in the validation are set to values which are the same as those
of the pre-existing record (thereby failing the uniqueness check).

...

OUR ISSUE:
This matcher works a bit differently than other matchers.
As noted before, it will create an instance of your model if one
doesn't already exist. Sometimes this step fails, especially if you
have database-level restrictions on any attributes other than the
one which is unique.
```

As you can see from the explanation above, since our test database currently doesn't actually have any records in it, when the `validates_uniqueness_of` validation runs, it needs to first create an instance of our model, but when it tries to do that, the instance that should-matchers tries to create ends up failing our database-level constraints, which throws the error that we saw.

To solve this issue, we need to make sure that there is at least one user existing in our test database before we can run the uniqueness validation.

Let's do that by creating a user before running our validation tests:

```ruby
describe 'validations' do
  User.create!(username: 'markov', password: 'password')
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:username) }
end
```
Now, run the specs to see if it's working.

Excellent!

**Before moving on, run the specs just one more time.**

Yikes. We now have a new error:

```
Validation failed: Username has already been taken (ActiveRecord::RecordInvalid)
```

The first time we ran the spec and created a User with a username of 'markov', that actually persisted to our test database. When we ran the specs a second time, it tried to create another user with a username of 'markov', which then failed our ActiveRecord uniqueness validation.

Fortunately for us, RSpec can execute code in transaction if we wrap it in either a `before(:each)`, a `let`, or a `let!` block. What "executing in transaction" means is that if we instead run:
```ruby
describe 'validations' do
  before(:each) do
    User.create!(username: 'breakfast', password: 'password')
  end
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:username) }
end
```
Then it will now create that User with the username 'breakfast' before each example group, but after each example is done running, it will rollback that transaction and undo the creation of 'breakfast'. In otherwords, 'breakfast' won't persist to the database.

### `let` & `let!`
Now is probably a good time to also refresh our memory on `let` and `let!`.

According to the [Relish docs on let][let-docs], `let` is used to define a memoized helper method where the value will be cached across multiple calls in the same example, but not across examples. `let` is lazy-evaluate, which means that it won't be evaluated until the first time the method it defines is invoked. Use `let!` to force the method's invocation before each example.

That was a lot, so let's break it down:
```ruby
describe 'let example' do
  let(:markov) { User.create!(username: 'markov', password: 'password') }
  it "should be named 'markov'" do
    expect(markov.username).to eq('markov')
  end
end
```
In this very simple example above, when we say, `let(:markov) { User.create!(username:'markov', password: 'password')}`, that essentially is similar to us defining a helper method like this:

```ruby
def markov
  User.create!(username:'markov', password: 'password')
  # note how the return value of this method is the User `markov`.
end
```

So, when we reference `markov` in the `expect(markov.username)`, we're basically calling on that `markov` helper method that we defined using `let`.

Using `let` is helpful if we need to reference a specific object multiple times across different example groups without having to redefine or create a new one each time. And, as previously stated, if we're creating an instance of a model, that record does not actually persist to the test database, which could save us a lot of headache if there are uniqueness constraints.

For our case, we actually want to use `let!` instead of `let`. Remember, `let` is not actually evaluated until it's invoked. Looking at our current user spec, if we change it from a `before(:each)` to a `let`:

```ruby
describe 'validations' do
  # before(:each) do
  #   User.create!(username: 'breakfast', password: 'password')
  # end
  let (:user) { User.create!(username: 'breakfast', password: 'password') }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:username) }
end
```
Then we still have the issue of not having created a User record before running the `validate_uniqueness_of` test since we never actually invoke the `:user` helper method. (Yes, at this point, this wouldn't actually cause us issues since we created `markov` earlier, but if someone else clones this project and wants to contribute, then they would have issues with this spec.)

Let's (pun intended) instead change it to `let!`, which forces the method to be evaluated **before** each example group (therefore actually creating the User before the uniqueness validation), while still allowing for us to later call on the `:user` helper method.

Disclaimer: The proper way to test is usually a hoty-debated topic. [Some people don't like using `let`.][lets-not]

[lets-not]: https://robots.thoughtbot.com/lets-not

Alright, that was a pretty length explanation, but hopefully you have a much better understanding of now of `before(:each)`, `let`, and `let!`. Before moving on, make sure you have specs written for the following:
* Validation of presence for `username`, `password_digest`, and `session_token`
* Validation of uniqueness for `username`
* Validation of length (of at least 6) for `password`
* Association for `favorites`
* Association for `favorite_benches`

[let-docs]: https://www.relishapp.com/rspec/rspec-core/v/2-5/docs/helper-methods/let-and-let
[shoulda-matchers]: https://github.com/thoughtbot/shoulda-matchers
[uniqueness-docs]: https://github.com/thoughtbot/shoulda-matchers/blob/master/lib/shoulda/matchers/active_record/validate_uniqueness_of_matcher.rb

## Test for model class methods
The User model in BenchBnB only has one class method. Let's write tests for `.find_by_credentials`. Copy and paste the template below and fill in with the appropriate tests. *Hint: Consider moving `let (:user) { User.create!(username: 'breakfast', password: 'password') }` out one block so that you can access `:user` in your `model_methods` tests.*

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # previously written tests
  end

  describe 'associations' do
    # previously written tests
  end

  # Copy and paste the following:
#########################################################
  describe 'model_methods' do
    describe '.find_by_credentials' do
      context 'when given correct credentials' do
        it 'should find the right user' do
          # test goes here
        end
      end

      context 'when given incorrect credentials' do
        it 'should return nil' do
          # test goes here
        end
      end
    end
  end
#########################################################
end
```

## Test for model instance methods
There are actually a couple of public instance methods for the User model, including `#password=`, `#password_is?`, and `#reset_session_token!`. Since `#password=` is simply a method set up to allow for us to not have to manually hash the password every time, we won't write a test for that now.

`#password_is?` is just a helper method that `.find_by_credentials` is using, so we also won't write tests for that.

Let's write a test for `#reset_session_token!`. Underneath the `describe 'model_methods'` block, copy and paste the following template and fill in the appropriate test:
```ruby
  describe 'instance_methods' do
    describe '#reset_session_token!' do
      it 'resets the session token' do
        # test goes here
      end
    end
  end
```
Alright, at this point, all of your model tests should be passing, and you should have tests for validations, associations, the public model class methods, and the public model instance methods.

Let's move on to [setting up factories!][factory-setup]

[factory-setup]: ./factory-setup.md
