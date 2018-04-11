# W5D1

---

### Solutions Questions

---

### Assessment Question

---

### Overview
+ Debugging
+ RSpec Review
+ RSpec and Rails
+ RSpec and Models
+ Factories
+ BDD + Unit testing
+ Capybara
+ Debugging Capybara

---

### Debugging
+ read the error
+ examine the stack trace, RSpec -> failure output, browser -> server log
+ `byebug`, code stops in server log!
  + restart the server/console if you change the `Gemfile`
+ `better_errors` + `binding_of_caller`
+ `save_and_open_page` + `launchy`
+ right click -> inspect element and look at ACTUAL HTML
  + can also use chrome dev tools to delete cookies

---

### RSpec Review

+ `it { expect(thing.returns_five).to eq(5) }`
+ `describe do...` `context do...` - makes context groups
+ `to eq(...)`, `not_to eq(...)` [more](http://www.rubydoc.info/gems/rspec-expectations/frames)
+ `let` / `let!` / `subject` - memoized helpers
+ before/after(:example / :context / :suite) hooks

---

### RSpec Rails

+ `gem 'rspec-rails'`
+ `rails generate rspec:install` - now generated stuff makes specs
+ controllers: `get :index` can test `response`, `render_template`

```ruby
RSpec.describe PostsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
      #...
```
---

### RSpec and Models
+ models: normal RSpec syntax, create instances, check properties
+ `shoulda-matchers` awesome for testing validations, associations
```ruby
describe Robot do
  it { should validate_presence_of(:arms) }
  it { should have_many(:laser_cannons) }
end
#...
describe Post do
  context 'validations' do
    subject { FactoryGirl.build(:post) }

    it do
      should validate_uniqueness_of(:slug).
        scoped_to(:user_id).
        with_message('duplicate slug within same user_id').
        case_insensitive
        #...
```
---

### Factories
+ initializing/creating models isn't DRY
+ `gem 'factory_girl_rails'` gives us the ability to make factories
+ `/spec/factories/users.rb` for our factories, if model is `User`
+ then can create: `FactoryGirl.build(:robot)` or `...create(:robot)`
+ can even build associated objects!
+ example on next slide
---

### Factory Example
```ruby
FactoryGirl.define do
  factory :robot do
    name { Faker::Internet.user_name }
    association :creator, factory: :robot_creator, name: 'Robots Inc'

    factory :happy_robot do
      mission 'spread love and friendship'
    end

    factory :angry_robot do
      mission 'destroy'
    end
  end
end
```

---

### BDD + Unit Testing
+ today not unit testing, only integration
+ tests simulate user behavior and measure system response
+ preferred tool is Capybara - headless web browser

---

### Capybara
+ strategy is to visit pages, fill in fields click, links/buttons
+ then verify content on pages
+ instead of `it` use `scenario`, instead of `describe`, `feature`
+ exposes `page` for your verification
+ example on next slide

---

### Capybara Example
```ruby
describe "the signin process", :type => :feature do
  before :each do
    User.make(:email => 'user@example.com', :password => 'password')
  end

  scenario "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end
```

---

### Debugging Capybara

+ `save_and_open_page` -  must have `launchy` in Gemfile

---

# END

---

### Demo
+ `factory_girl_rails`, `rspec-rails`, `faker`, `capybara` to :dev/:test
+ rspec install
+ add boilerblate to config/application.rb
+ generate dogs model, dog has treats
+ make dogs controller that can CRUD dogs
+ dogs show displays treats
+ factories, series, associations
+ features, capybara
+ let and subject
+ have content, not
+ feature, scenario syntax
+ save_and_open_page
+ helper method in module and include using config
[resources](https://github.com/thoughtbot/guides/tree/master/style/testing)

---
