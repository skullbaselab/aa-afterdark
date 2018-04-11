# Testing Controllers

## Overview

We test controllers in Rails to make sure that our controller actions are rendering the correct response.

Controller testing in Rails is an example of "service level testing" - the middle level of the Testing Pyramid. Controller tests are simpler to write and run faster than integration tests. Solid controller tests are an important part of a strong Rails test suite.

## Creating the spec files

Let's write tests for our Benches controller. To generate the spec file, run `rails generate rspec:controller #{controller_name}`. **Pay close attention to the controller name here.** Since we're now using Rails to serve up API endpoints, most of us have nested our controllers under an `api` directory. In fact, if we look at our Benches Controller, we can see that it's actually named `Api::BenchesController`. Therefore, the correct command here would be `rails generate rspec:controller Api::Benches`.

## Writing tests

You should write tests for each action in your controllers.

RSpec Rails provides us with several helpful methods for testing controllers. We can use RSpec Rails to simulate a request, then verify that the controller sends back the correct response.

Here are some useful shoulda-matchers methods you may wish to use:
* `render_template`
* `redirect_to`
* `respond_with`

Let's look at an example. Assume that we are testing our app's `LinksController`.

```ruby
class LinksController < ApplicationController
  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      render :show
    else
      render json: @link.errors, status: 422
    end
  end

  # ...
end

```

To simulate a request in RSpec, we specify an http method, controller action, and params. We can then test the `response` using shoulda-matcher's ActionController matchers.

**Be sure to read the comments in the code below to get a better understanding of how controller tests work.**
```ruby
RSpec.describe LinksController, type: :controller do
  describe "GET #new" do
    it "renders the new links page" do
      # this line simulates a "GET" request to the LinksController that hits the
      # new method, passing in `{link: {}, format: :json}` as params.
      # notice the 'format: :json', without that specification in the params,
      # it will try to render an HTML view, which does not exist (our views are jbuilders).
      # Try it out without the `format: :json` to see the error it throws!
      get :new, link: {}, format: :json

      # here we check to make sure that the response renders back the new template
      it { should render_template(:new) }

      # here we check to make sure that the response renders back the
      # correct status code
      it { should respond_with(200) }
    end
  end
end
```

It is important to test the controller's response under different contexts. For example, we should test our `LinksController`'s create method, with both valid and invalid params.

```ruby
describe "POST #create" do

  context "with invalid params" do
    before(:each) do
      post :create, link: { title: "this is an invalid link" }, format: :json
    end
    it { should respond_with(422) }

    it 'does not create the link' do
      expect(Link.exists?).to be false
    end
  end

  context "with valid params" do
    before(:each) do
      post :create, link: {title: "teehee", url: "cats.com"}
    end
    it { should render_template(:show) }
    it { should respond_with(200) }

    it 'creates the link' do
      expect(Link.exists?).to be true
    end
  end
end
```

Now that you have a better understanding of how controller tests work, write out tests for the BenchesController's `#show` and `#create` methods. We'll get to the `#index` method next.

*Hint: When writing a test for your `#show` method, you'll need to pass in `:id` in params. Be careful here because even though creation of objects roll back if you wrap them in a `let!` or `before(:each)` block, that row will still be used. For example:*

```ruby
describe 'rollback example' do
  let(:bench) { Bench.create!(description: 'ugly', lat: 0, lng: 0) }

  it 'does not always have an `id` of 1' do
    expect(bench.id).to eq(1)
    # the above is only true the first time the test runs
    # the next time it runs, even though the fist bench did not
    # persist to the database since it was rolled back, that row is now taken.
    # The second time the test runs, the bench's id is now 2. The next time,
    # it's 3, and so on...
  end
end
```

## Testing Controllers that serves up JSON responses
Back when you first learned how to write RSpec tests for Rails in the main curriculum, the response that our controllers served up were `html.erb` views.

According to [the top answer in this stackoverflow post][stackoverflow-controller], in the traditional Rails apps, we wouldn't actually want to test the outcome of the template rendering in our controller specs, since we would leave that to view specs. Instead, you "should only test the behavior of your actions & filters your controller tests."

[stackoverflow-controller]: http://stackoverflow.com/questions/1063073/rspec-controller-testing-blank-response-body

In fact, if you throw a `byebug` into one of your controller tests and looked at the `response` object, you'll see that the rspec-rails has hacked into Rails to prevent it from actually rendering view templates. For example, `response.body` returns an empty string rather than the view template it would normally render in production and development.

Since we are now using Rails to primarily serve up API endpoints for our React frontend, we could consider [testing our controllers in a different way][testing-jbuilder] to also test the specifics of our response.

[testing-jbuilder]: http://ahimmelstoss.github.io/blog/2014/07/27/testing-a-rails-api-with-rspec/

Let's use our BenchesController's `#index` method as an example to figure out how to do this.

The first thing we have to do is to make our controller specs render templates as the app normally would, using the render_views directive:

```ruby
describe 'GET #index' do
    render_views
    # Without the above directive, response.body would only be an empty string.

end
```

Now, we can actually look at the `response.body` to see what's being rendered. More specifically, `JSON.parse(response.body)` would give us the object that we're expecting.

Copy and paste the following template and fill in the rest of the tests:

```ruby
describe 'GET #index' do
    render_views
    # Without the above directive, response.body would only be an empty string.

    # Creating two benches using our factory:
    let!(:bench_1) { create(:bench)}
    let!(:bench_2) { create(:bench, lat: 50, lng: 250) }
    context 'when there are no bounds or seating ranges' do
      before(:each) do
        get :index, { format: :json }
      end

      it { should respond_with(200) }
      it { should render_template(:index) }
      it 'renders all existing benches' do
        # test goes here
      end
    end
end
```

### Bonus
Using the `JSON.parse(response.body)`, write tests for the following contexts under the BenchesController's `#index` method:
```ruby
context 'when there are bounds' do

end

context 'when there are seating ranges' do

end
```

## Final thoughts
There are multiple differing opinions on the correct way to test controllers in Rails. In fact, with Rails 5, there have been several changes introduced specifically on how to test controllers. Read about them [here][rails5-controller-testing] and [here][rails5-controller-testing2].

[rails5-controller-testing]: http://blog.bigbinary.com/2016/04/19/changes-to-test-controllers-in-rails-5.html
[rails5-controller-testing2]: https://everydayrails.com/2016/08/29/replace-rspec-controller-tests.html

The goal today was to lay a foundation for you to easily write specs for your own projects, as well as to present some different ways to test your controllers.

For more information on writing controller specs, consult the [documentation][rspec-controller-docs] or [this blogpost][rspec-controller-blog].
[rspec-controller-docs]: https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs
[rspec-controller-blog]: https://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html

## Homework
Write tests for the models and controllers in your FSP this week.

Please be aware that there may be some issues if your Gem versions are different, especially if you are using Rails 5. If this happens, don't panic; google!

Also, remember to do the homework listend on the [Week 2 README][week2-hw] (reading the Jest articles and writing tests for one of your reducers).

[week2-hw]: https://github.com/appacademy/graduated-seekers/tree/master/week-2#homework-for-next-week
