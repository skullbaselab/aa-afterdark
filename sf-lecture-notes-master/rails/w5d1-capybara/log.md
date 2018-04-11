# W5D1 - Capybara

## Lecturer: Kelly
### January 8, 2018
### Scribe: Ryan

+ Do we have to worry about database validations on the exam?
  + That is correct; you do not
+ The video suggests that nested routes do not matter
  + That is not correct; they do matter
+ For datatypes, is it OK to just know integers and strings?
  + Yes, that is fine 
+ Do we have to care about adding an index to the schema?
  + No, you do not
+ Can we open our app in Chrome (localhost)
  + Yes
+ Can we use rails g scaffold on the assessment? 
  + I am not sure; I will follow up
+ If you realize that you have made an error in application.rb, would you reinstall rspec?
  + Yes
+ Do we need a common between the features in the factory do-end loop?
  + No
+ Can the values in the factory do-end loop be symbols instead of strings?
  + Yes, if you really want them to be symbols 
+ We would be writing tests within development of our full-stack projects?
  + No, you don't have time for that 
+ I am not sure why you have both :user and :sub_user
  + To make my results more deterministic if I specitically want a User named Kelly
+ Where do you put your factories 
  + You put them in the factories folder
+ Def new would not work until the new.html.erb template has been created, correct? 
  + The test should only look for the presence of the method, not the template
  + That said, the test breaks from the pattern of testing and _does_ require the new.html.erb template
+ So in the create method, would it try to render create.html.erb?
  + Not if rendering ore redirecting is happen as an implicit end-result of this funciton 
  + It only needs one template to look at / route to follow; it will follow to the function template (create.html.erb) by default if nothing else is given 
+ What is the difference between flash and flash.now? 
  + Flash will work for both redirecting and rendering; it persists to the next req/res cycle 
  + Flash.now will only work for render because it specifically does not persist to the next req/res cycle 
+ When you say it exists for the next cycle, do you mean it just persists for one more cycle? 
  + Yes, just one more
+ For styling, does it matter if we implicitly or explicitly render? 
  + Ruby follows a convention of implicity whenever possible 
+ If you just left flash[:errors] what would work, wouldn't it? 
  + No, it would not 
+ What is let! on line 4
  + This is about the difference between lazy and eager loading
  + When you say let withou a bang operator, the code is not executed until I call :user
  + When you add the bang operator, you don't need it to be called in your tests; it will be called beforehand
+ Can you define session params using the private method SessionController#session_params 
  + This pattern suggests that we will persist the parameters to the database
  + In fact, we just use them as inputs for our helper method find_by_credentials
+ Is that also why we don't use user.errors.full_messages? 
  + Yes
+ For RSPEC, when it's creating a user, where is it stored? 
  + This information is being saved in the database designed for the testing environment 
  + Information that is saved or created for the test will be destroyed after the test is completed 
+ So we don't need bundle exec command before rails? 
  + It depends on your rails version 
  
### To Follow Up

+ Are scaffolds legal on A04? 

## Lecturer: Kelly
### October 30, 2017
### Scribe: Jesse

+ the way that Capy works, is it possible that you could have controller issues but still pass views specs?
  + the integration tests "assume" that the other parts work, but don't guarantee that they'll work using mocks or anything like that.
+ what is the diff between be db:create and just db:create
  + the version of rails or rspec or w/e on your machine might not be the same as the version used to create the file initially, so in order to ensure that the correct version is used when running the program, bundle exec is necessary
+ What about just instance methods?
  + this descriptor is intended to include both class and instance methods
+ with "shoulda matchers" gem, the gemfile in the buggy version has some issues and referencing the branch of 'rails 5'
  + will be handled, in the update of the buggy version
+ if we use factory_bot.create does it persist to the db?
  + it persists to the test db only
    + if we have unique constraints in our db, will factory_bot cause errors then if we just keep recreating these same test users
      + the specs will clear the db as they finish running/overwrite themselves
+ if you run test db:load will you  lose access to the original db?
  + the test db is only for the spec files and other files used to test your code, but for rails c and other normal means of interacting with the db, your normal db will be the default
+ should we put our factory_bot/faker assignments in curly braces?
  + it depends on if you want to have factory_bot run that Faker block every single time a new instance is created or if you just want Fakerto make one instance and use that same one every time.
+ Where it says user.create, we can use factory_bot.create in that instance
  + yes, Factory.build => User.new, Factory.create => user.create!
+ Rspec and Capy are completely different/separate testing libraries correct?
  + yes


### Assessment 4

+ Are the Rspec on A04P congruent with what is going to be on A04
  + yes
+ Can you ball-park the passing spec amount
  + Perhaps 70%-80%, hard to say.
+ Will we have the same kind of views on the assessment?
  + yes
+ link_to and button_to are shortcuts, but should we be writing the html out for them?
  + for this A04 yes, but ultimately, they are the same thing and the tests will pass for either implementation



## Lecturer: Kelly
### August 28, 2017
### Scribe: Stephen

##Questions
### Presentation

+ What is the difference between development, production, and test?
  + Production is a full-fledged database attached to the project and deployed to real users. Development is a smaller database with 'dummy' data, very likely to be thrown out as soon as you're done with it. Test databases create data totally unrelated to development or production for the purpose of testing specific features (using a testing library)

+ Can we see those different databases in the tree?
  + Sure, just look in database.yml

+ config/application.rb controls auto-generated specs for controllers, etc.

+ Why do model specs not show up in the generator?
  + I don't know why that is actually, let me get back to you on that.
  + *Scribe note: When you set the controller the model defaults to that as well*

+ If you're building a nested symbol in Capybara, would you say parent.attribute_name or just attribute_name?
  + You'd just say attribute_name. No need to include the parent.

+ Would there ever be an instance where you'd generate multiple instances of the Factory Girl class?
  + Absolutely, but it might be better to use Faker instead of FactoryGirl.

+ Is every instance of FactoryGirl get deleted from the test database after they are used?
  + It depends, and the reason why is because you can tweak those options in the database. You could make everything a transaction, or you could configure it as an end-to-end test, etc.
    + Is the default that it will persist in the database?
      + That's correct, but in most cases it won't matter. There are database cleaner gems in case that's a concern for you though.

+ Why do we use model_path vs model_url in testing?
  + They have slightly different functionality. For the purposes of the tests here, it doesn't really matter, but they hit a slightly different URL.

+ Could we potentially test with the production/development database?
  + Not really, but there are commands where you can basically copy-paste the data from one database to the other.

+ What is with_message(:required)
  + I believe that checks it is a Rails 5 automatic validation.
    + If you put optional: true would that throw an error in that validation?
      + Yes. optional: true removes the automatic validation for the belongs_to association.

+ How does the rspec file know which controller to hit?
  + Because the file is attached to the specific controller, the symbols in the specs will activate the method name in that controller.

+ What happens when you have multiple acceptable outcomes to a spec?
  + You would probably have to hack some sort of solution, you wouldn't be able to do that with just expect statements.

+ Why do we use "let!"? What is the significance of the "!"?
  + *I'm not sure. Let me get back to you on that.*

+ Is Capybara strictly for testing or can you use it for other things?
  + Don't steal my thunder!

+ Can you use Selenium to apply to jobs?
  + I'm not going to comment on the matter, -wink wink- *yes*
  + In all seriousness, quick apply with bots will get you a much lower response rate than filling out the application yourself.

+ Would another use-case be automatic check-in on Progress Tracker?
  + I'm not going to comment on that either, -wink wink-
  + If you actually do it though, we'll probably have to rewrite it, so please don't, lol

+ How do we know what page we're supposed to be on when we run these tests?
  + It's because we use the visit() method to go to a specific url.

+ What is "page"?
  + Like "response", it is data provided to you by Capybara's API.

+ As the application gets bigger and code is refactored, how would we refactor the spec_helper?
  + I don't think that's really necessary, spec_helper is basically included everywhere.
    + But doesn't it get really huge?
      + Ah, yes. I think that's just a necessary evil though.
      + On the other hand, you could include custom files yourself, spec_helper is simply included automatically.

+ For make_link, is that a spec_helper method?
  + You're absolutely right.

### Assessment 4

+ Do we have to type out associations?
  + I don't think that's necessary after A03.
  + We also don't do validations for database, so you can leave off null: false. Just save yourself some time (it's not the focus of A04).
    + Jeff said we should do full associations.
      + I'll get back to you with the official word on that. I don't think it's necessary.

+ (Something about nested routes)
  + Highly recommend studying nested parameters. Will be very useful not just for A04, but also your full-stack as well as many common APIs that the giant tech companies use.

+ If you were to nest comments under links and also a separate resources for comments, would that cause any problems?
  + We'd just have multiple routes that hit the same controller actions.

+ For the practice we had to create a nested :create but not a nested :destroy. Why wou-- why? Whyyy... why? *laughter*
  + It's easier to create a nested resource with access to for example the user_id of that resource right in the url.
    + Why wouldn't we just nest everything then?
      + It's just considered redundant.

+ How would we able to determine beforehand what routes should be nested?
  + You'd see in the specs for that controller.

+ Where does the session hash live and when is it created?
  + session[] and params[] is provided to you whenever a controller is created, and exists for the duration of the request-response cycle.

+ Is it common to only nest index? Just as a general practice.
  + There are two kinds of routes generally, member routes and collection routes. Collection routes are usually nested (to filter) while member routes are rarely nested except by necessity.

### Quiz

*NOTE: It's the wrong quiz again(?)*

+ Is there any way to test private methods in the model?
  + You'd test the corresponding public method that calls it.


# June 23, 2017

Lecturer: Kelly Chung
Scribe: Aaron Wayne

1. Is there a diff between integration and surface level testing?
  + Believe they are different naming conventions
1. On assessment, will skeleton be provided?
  + Yes
1. What are fixtures?
  + Worse version of factory girl
1. what is gem install doing?
  + Saving it locally with your gems so you can include it in your Gemfile
1. For factory girl, what if your test is looking for something specific, like length, but it has a false negative because faker generates something under that length?
  + Will get into it, but you can make it a constant or have faker generate them under conditions.
1. Is factory girl rails and faker usable in ruby?
  + factory girl has another version for normal ruby and faker is usable everywhere.
1. What does `:inverse_of` do in has many?
  + White board time!
1. Can you put them in the same line?
  + Maybe, you should try.
1. would you have to do {capy: { name: "" } }?
  + No, just pass it an options hash of the attributes
1. what is the difference between build, save, create!?
  + build does not save it to the database while save and create(!) will.
1. Is `.through` part of shoulda-matchers library?
  + yes
1. WHat would the select look like?
  + not sure it is a method, but if it is, it's probably what you expect.
1. Can we access the info that the query returns?
  + it is just inspecting it
1. Does it check the underlying sql query?
  + exactly
1. Will it work for a heredoc?
  + It might if it looks at the actual sql, but not if it looks for the activerecord method.
1. Would it work with a sql fragment instead of where(color: "rainbow")?
  + yes, since it is an activerecord method
1. will rails auto generate all routes for a resource?
  + yes, but they are wrong. it's always good to check what rails does for you
1. Why do we need to use create before the get show?
  + It needs to be saved to the database to make sure there is something in the database.
1. Will the capys be saved in the database?
  + Yes, it will persist.
1. What if there are other things in the database? (looking for id: 1)
  + It isn't checking for that specific created one, but creating one guarantees that there will be at least one in the DB
1. Is it possible to do id: Capy.first.id
  + You could but, it's not needed.
1. what is link: {}?
  + It is a key that points to an empty hash.

# W5D1 Log

# 04/21/2017

Lecturer: Kelly Chung
Scribe: Robert Koeze

## A04 tips

* take the assessment 8 times

## Lecture

* Is the scheme at the top of the file a result of the annotate gem?
* When you run tests and save stuff, is that saved to the test database?
* What does the Shouldamatchers look like?
* Will the testing setup we're learning today be on the assessment?
* Is a shoudamatcher called on a subject automatically?
* Why do we put expect response.to be_success before expect response.to render template?
* If there's already a Capy in the test database, do we have to create a new one?
* Is Capybara capable of executive Javascript on the front end?
* Does Capybara maintain cookies?
* What's the difference between an intergration versus an end-to-end test?

# 2/20/2017

Lecturer: Claire

## Friday's Assignment
* Is there a preferable way to write routes?
* Do you want routes to reflect associations?
* In MusicApp, why was `create` was nested and `new` wasn't?
* What do member routes do?
* What's going on when you redirect and render in the same action?
  * Wouldn't you have access to the variable anyway if you rendered the show page?
* How do we persist form data?
* When we render the `new` view on a `create` fail, the url changes and it's annoying?

## Quiz
* What's the difference between `new` and `build`?

## Homework
* Why do we `save!` later in the specs?
* Do the specs take so long because we're resetting the database so much?
* Do we use spring?
* What does `before` do without `each`?

## Today's Material
* When we add new functionality and start failing specs, should we start by fixing the model?
* How does `inverse_of` work?
* When we write a shoulda matcher to test the `author` association, is it forcing us to name it `author`?
* Could we write matchers that didn't specify an association name?
* Does test data exist in our database?
* Can we redirect to `Sub.last` in our tests?
* Can we use `describe`, `context`, etc in Capybara?
* Can we get away with not having a `current_user` in the controller?
* How do you come up with what to test for invalid params?
* How do writing specs work with nested routes?
* Would `current_user.subs.new` work without `inverse_of`?
* Does the test know whether the variables are passed through the params or hardcoded in the controller?
* Do our url helpers need to match what the specs want?
* Are controller tests integration tests?
* Shoulda matchers have controller methods, can we use them?
* Do you have to launch the rails server to test features?
* Does it matter for the spec if we render vs redirect?
* Can we use url helpers in the specs?
* How does Capybara use the labels?
* If we have two forms that look the same (e.g., sign up and sign in), how can we tell them apart?
* How can we test if the input field is actually filled in?
* When does Capybara use the `id` field?
* Why don't we test if the `id` is passed into the params?
* What does it read for links/buttons?
* What's the difference between `update` and `update_attributes`?


# 10/10/2016

Lecturer: Claire

## Friday's Assignment
** no questions **

## Quiz
+ question 1 was missing from PT

## Homework
** no questions **

## Today's Material
+ Why do we need different types of tests? Why can't we just do integration tests?
+ How to use `save_and_open_page`
+ Is Rspec just used for unit tests and cabybara for integration tests?
+ Will factory automatically pass your database level constraints/fill in all your required fields?
+ `click_on` for links as well?
+ how do you drop downs for `select` options?
+ Can you use cabybara for testing javascript/animations?
+ does cabybara/rspec save these things to the test database?
+ how do nested factories work?
+ can we test that errors are added to the flash?
+ students were confused about `find` raising an exception if no record if found
+ Does rspec run its own server?
+ How do we do blocks for testing exception raising?
+ How we do specify an http method with `visit`?



# 8/8/2016

Lecturer: Brooke

## Friday's Assignment
+ inverse_of association
  + so it's literally the function's inverse?
  + can you use it on join tables?

## Quiz
** no questions **

## Homework
** no questions **

## Today's Material
+ should we specify version numbers in our gemfiles?
+ can we use our browser to debug on the assessment?
+ does save_and_open_page stop the specs from running?
+ why are better_errors and binding_of_caller only in the development group and not in the test
+ what group should shoulda-matchers be in?
+ what is the difference between the development and test groups? what does `group :test` mean?
+ how do we tell rails to use a particular environment?
+ should `rails g rspec:install` be the second thing we do when we're creating a new rails project?
+ ?? something about feature specs? i couldn't hear the question
+ what is the `guard-rspec` gem?
+ what happens with the `it` statements that don't have `do ... end` after them?
+ what's the purpose of the validations testing?
+ shoulda-matchers don't always work for testing associations
+ ?? something about status codes in HTTP responses? i couldn't hear the question
+ ?? something about be_success in capybara? i couldn't hear the question
+ ?? something about render_template? i couldn't hear the question
+ ?? something about checking if errors are raised in the course of running a spec? i couldn't hear the question
+ do factories inherit from the top down? do they run from the top down?
+ does `fill_in` look for a label, a name, or a property?
  + does it ignore colons on purpose? does it ignore other extra symbols or words?
+ ?? something about `click_button`?
+ how would you use capybara for a form with multiple labels with the same text?
+ can we use buttons instead of links? can we change the assessment to test for buttons?

## 6/6/2016

Lecturer: Brooke Angel

### Questions

  * How do things end up in the `sub_ids` array? (Checkboxes)
  * What does the `sub_ids` method do? Does it just set an array? (Overview of the checkboxes videos.)
  * What does the `rescue ActiveRecord::` do in the links controller tests? (A: for when can't find `current_user.links.find(:id)`)
  * Where do the helper methods live? (`spec_helper.rb`)

### Mistakes
  * Don't understand checkboxes or `inverse_of`
  * Misspell things with Capybara

### Notes

  * Students seemed super confused about check boxes and the `sub_ids=` method - did they even watch the videos?
  * We accidentally forgot to upload the quiz :( Problem has since been resolved.
