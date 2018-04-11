# Testing our Rails Apps

---

## Agenda

* Testing overview
* Models
* Controllers
* Capybara
* Write backend tests for your FSP!

---

## Why test?

- In production:
  - Make sure our code works
  - Increase flexibility and reduce fear when refactoring
  - Makes collaboration easier
  - Produce documentation

- In the job search:
  - Add to your resume & distinguish yourself from other applicants
  - You will need to write tests for coding challenges
  - Testing comes up frequently in interviews

---

## Unit vs. Integration Tests

- **Unit tests:** each individual unit works correctly (model testing)
- **Integration testing/Service testing:** test that parts of your application work together (controller testing)
- **End-to-End:** integration tests on a bigger scale that test user experience (UI testing)

---

## Testing Pyramid

![testing-pyramid](http://2.bp.blogspot.com/-YTzv_O4TnkA/VTgexlumP1I/AAAAAAAAAJ8/57-rnwyvP6g/s1600/image02.png)

* [why google adopted this model](http://googletesting.blogspot.com/2015/04/just-say-no-to-more-end-to-end-tests.html)

---

## Setup

- Add required [gems](https://github.com/appacademy/curriculum/blob/master/rails/demos/CapybaraParty/Gemfile)
  - `rspec-rails`
  - `capybara`
  - `factory_girl_rails`
  - `shoulda-matchers`
  - `launchy`
  - `better_errors`, `binding_of_caller`, `annotate`
- Build file structure with `rails generate rspec:install`
- Can configure test files to be [automatically configured](https://github.com/appacademy/curriculum/blob/master/rails/readings/rspec-and-rails-setup.md#auto-generate-test-files)

Note:
- Might need to add the below to your `rails_helper.rb` file
```ruby
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```

---

## Where specs live

- Put them in the `spec` directory, in `model`, `controller`, or `feature` subdirectories
- Helper methods go in `spec_helper.rb`

---

## Testing Models

---

## What to test
- Associations
- Validations
- Class methods
- Error messages

*Shoulda matchers are your friend!*

---

## Example Model Spec

```ruby
describe Robot do
  it { should validate_presence_of(:arms) }
  it { should have_many(:laser_cannons) }
end
#...
describe Post do
  context 'validations' do
    subject { FactoryGirl.create(:post) }

    it do
      should validate_uniqueness_of(:slug).
        scoped_to(:user_id).
        with_message('duplicate slug within same user_id').
        case_insensitive
        #...
```


[DEMO](https://github.com/appacademy/curriculum/blob/master/rails/demos/CapybaraParty/spec/models/capy_spec.rb)


---

# Testing Rails Controllers

---

# What to test?
* Status codes and responses under various conditions
* Valid and invalid params

---

# RSpec Rails API

* Requests
  * `get`
  * `post`
  * `patch`
  * `delete`

* Assertions
  * `render_template`
  * `redirect_to`
  * `have_http_status`, `be_success`

---

## Example Controller Spec

```ruby
RSpec.describe DemoController, :type => :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
      #...

```
---

## Factories

- Factories keep things dry!
- Using Factories with Faker helps create randomized data
- Configure to [automatically generate files](https://github.com/appacademy/curriculum/blob/master/rails/demos/CapybaraParty/config/application.rb)
- `build` vs `create`

```ruby
FactoryGirl.define do
  factory :apartment do
    landlord 'Bob'
    address { 1 + rand(100) }
    street { Faker::Address.street_name }
    city { Faker::Address.city }
    zip { Faker::Address.zip }

    factory :rented_apartment do
      rented true
    end
  end
end
```

---

## Useful Resources

- Documentation
	- `rspec-rails` [official docs](http://rspec.info/documentation/3.5/rspec-rails/)
  - [Relishapp docs](https://www.relishapp.com/rspec/rspec-rails/docs)
  - [Capybara docs](http://www.rubydoc.info/github/jnicklas/capybara)

- Testing philosophy
	- [Better specs:](http://betterspecs.org/) very clear and helpful guidelines for `rspec`
  - [Thoughbot engineering blog:](https://robots.thoughtbot.com/tags/testing) top-notch rails shop and creators of `factory-girl` and `paperclip` gems
  - [Google testing blog:](https://testing.googleblog.com/) not Rails-specific


---

## Your Assignment

* Write specs for your FSP
	* Specs for every model
  * Specs for every controller
* Add backend tests as a feature on your production readme and your resume
* For next week:
  * Learn basics of Jest
  * Write tests for *one* reducer
