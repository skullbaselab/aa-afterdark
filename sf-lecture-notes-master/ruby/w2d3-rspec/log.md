# RSpec

### February 21, 2018

Lecturer: Cynthia
Scribe: Aaron

+ So manual testing means you're actually using it?
  + Yes, the testing pyramid is all automated testing. There could also
    be some manual testing
+ Sometimes, we require some randomization within the code. Could this
  cause a failure?
  + Yes! This means that something in your code should probably be
    changed. This could also be accounted for with doubles
+ What about if you're shuffling an array
  + Long answer. Said something about checking the elements
+ I said that the method should call `shuffle` on the array, is that
  valid to say how the method should be implemented?
  + You can require the method to be implemented a certain way if you
    like. 
+ Where does the code go to create those scenarios
+ Does let have the same scope as subject?
  + Yes
+ Can you use two subjects?
  + We don't want to. RSpec might even overwrite 
+ Is there also an `after` macro?
  + Yes
+ I thought `raise_error` took what type of error
  + We be taking a look at the docs in a sec to answer this
+ I don't understand the practicality for `doubles`
  + If you use instances of the other classes, it is relying on the
    functionality of another class 
+ Are we creating doubles because we might not have implemented the
  other classes yet?
  + That could happen, but not the reason we use them
+ How can we test instance vars that we don't want attr_readers on 
  + Missed her answer
+ Can we get the code? 
  + Yeah online 
+ Are we placing curly braces because we are expecting an error? 
  + Yes, we are expecting an error to be raised
+ Can we put curly braces even if it isn't going to error 
  + It's checking the return value so the curly braces isn't the return value and thus we shouldn't do it 
+ Shouldn't we include an array or something in the RSpec file that contains all of our possible answers? 
  + We should do that in our code 
+ Sometimes you do expect and then call the method? (references hw)
  + Let's take a look at this after
+ Isn't apple an object? How is this working? 
  + If it was, we would probably have a #to_s method or something along those lines. But, our double is just the string so it works fine here as well. 
+ Would apple be a string object then? 
  + It's a double, not technically a string, it's a mock object 
+ How do we know that green tea and 100 are actually the right key value pair?
  + We could check for length or add some more expect statements 
  + Note: We probably should have keyed into drinks and checked the value
    + She came back to this in the next it block and then explained that she could have used this up above but wanted to show multuiple approaches 
+ If you put a before block wouldn't the green tea keep adding up? 
  + The before each runs for each individual test and resets between each one. 
+ How do I avoid writing bugs in my tests? 
  + If you feel like you're running into the issue, you can double check that your method works and then try to isolate it to your tests (for today since we are learning at least)
+ How should the work flow go today? 
  + Write all the it statements first then go one by one and run them as you finish them 

### December 13, 2017

Lecturer: Kelly Chung 
Scribe: Ryan Mease

+ There doesn't seem to be enough rationale for not testing private methods 
  + By creating a test for it, you're enforcing the idea that other developers need to care for / attend to the method 
+ When you're writing tests, you want it for every future developer looking at the code? 
  + Yes, that's right 
+ Are the tests written before the code? 
  + Yes, ideally
+ Because RSpec cannot test for private/protected methods, does that mean that it will not be on the assessment?
  + You will not be required to write private/protected methods on the assessments 
+ Last question on the homework: want to see if two units were collaborating properly: was that a unit test or integration test? 
  + That was an integration test 
+ Would it be fair to assume that any time that you're using let, you're doing an integration test? 
  + Not necessarily, let can be used to generated an instance of the same class, so it would just be a unit test 
+ Are there wildcards that I can use in the strings for these tests?
  + Let's discuss regular expressions more next week, when we have dedicated material for it 
+ Can we throw another function in there? (??)
  + Yes, that is possible 
+ Is there a way to test an instance variable without an attr reader? 
  + Yes, there's a function in RSpec called ivar get 
+ Can I have ?? function take more inputs and modify my code accordingly?
  + Yes, I can do this if I want to, just make sure that the code is written to be easily comprehensible 
+ Should I have a test for every variable and function? 
  + Not necessarily, depending on how important the variable is 
+ I saw a different approach using for_each in the homework; should I use that? 
  + To answer this, think about how many of your tests will rely on the output of this iteration 
+ Is the 'each' a required syntax? 
  + Yes
+ What if we used before(:all) instead of before(:each)? 
  + Let's try it out in the code demo
+ ?? 
  + That method doesn't currently exit, but if it did, the preferable way would be to 
+ Why not just make the instance? 
  + This isn't an assumption that we can make in the process of unit testing (?) 
+ Because let doesn't persist state, are there times when you're running a test consecutively, do you run into issues? 
  + ??
+ Is this double necessary? 
  + If the function that I'm testing takes in two arguments, and I don't give it a second argument, I will have an issue 
  + I will not yet run into an issue because (in the specific context of this code) I am not using it yet 
+ I think that I read in the reading last night, that I should just use raise_error without a message 
  + You want to pass this a raise_error message to make it clearer 
+ Does it even care about the error message? 
  + It does; it does some string matching 
+ Is it preferable to raise a specific class of error? 
  + The more specific, the better, but this isn't important for the scope of today's project 
+ Are you going to check for a randomized test today? 
  + I won't be covering that particular edge case, but there are ways that you couuld approach it (enumeration of approaches)
+ What if you just pass it a seed? 
  + Deferred to open forum 
+ Could you run it three times and see if any of the three times match? 
  + Deferred to open forum 
+ Can I use similarly? context instead? 
  + I am about to head into that material right now 
  
## Takeaways 

+ Post on Slack regarding Zhipeng's question: do we need an attr reader to test instance variables 

### October 11, 2017

 + Lecturer: Aaron Wayne
 + Scribe: Andres Alfaro

### Lecture Questions
1. Is it always bad to have tests that passed on the first run (RED phase).
  + Not always, depending on the nature of the test, sometimes they will pass in the RED phase.
1. Should we be creating tests for every single feature, covering all?
  + We should cover a couple of edge cases and core functionality, remember YAGNI.
1. Does order matter on _**context**_, _**describe**_, _**it**_.
 + _it_ will be contained inside a context or describe.
1. Why freeze objects?
 + Deferred to open forum.
1. Why do we write _RSpec.describe_
 + Convention, that being said, it is not required for the class to run.
1. Is _**it**_ tracking a test?
 + Yes, it defines a specific test.
1. Can we access the subject name _**:sloth**_ inside the _**it**_ by calling only _**slot**_, not using a symbol?
 + Yes, this is a feature of RSpec and metaprogramming.
1. Will the subject's updates persist across _**it**_ tests.
 + No they will not persists across _**it**_ tests.
1. Using predicate matchers is like calling a _x.method?_.
 + Yes, but the actual _rspec expectation_ is without the _**?**_.
1. How to we check if the actual object is Hash.
 + There is a specific _**RSpec**_ expectation for it.
1. Could we do '**to be_equal**' to check equality among objects.
 + Use carefully as this method uses _**==**_ and if we don't provide a custom _**==**_ it will check for the object to be the same (same object.id/memory location)
1. Describe and context are the same, are they interchangeable?
 + Yes they are, but we use them in a specific order to give some semantic order to our tests.
1. Is double independent from the class.
 + Yes, we are imitating the behavior / attributes of a real class.


### Notes
 + Try to repeat the question, its hard to hear the front row students questions all the way to the back.

### August 9, 2017

Lecturer: Dallas Hall
Scribe: Kelly Chung

### Lecture Questions

1. What happens if you want to test that private methods work as
intended?
  + Perhaps make it public to begin with if you feel that it's necessary
  and then move it to a private API.
1. What's a language called if it's not a DSL?
  + Not sure - I'd just consider them a DSL
1. What version is this defaulted to in the Gemfile?
  + This will go to the latest stable version
1. How do you check if it's an array?
  + `expect(x).to be_a(Array)`
1. Should you check default states of instance variables?
  + Yes and I believe I have
1. Before we `describe`, do we reset the subject?
  + We completely go to a fresh state of the subject prior to each it
  statement
1. What's the difference between `allow` and `expect`?
  + We're about to demonstrate right now - *proceeds with demo*
1. Is `rspec` aliased to `bundle exec rspec` on your computer?
  + Nope, but please continue to use `bundle exec <command>` in the
  future.
1. What happens if you only have an `allow` statement in one of the `it`
blocks?
  + There is nothing tested - you must have an `expect` statement to
  actually test something
1. Why can `allow` be replaced by `expect`?
  + Both of them set up listeners
1. Can you have `allow` statements in the `before` statements?
  + Absolutely
1. Will the testing we handle today going to handle most of the things
we're testing for the rest of the curriculum?
  + Yes

### <Date Here>

Lecturer: Luke Wassink
Scribe: Julianne Costa

## Chess

Q: Should all pieces be in one file?
A: Put them all in separate files for easy navigation.

Q: Where do the chess pieces come from in board.rb (line 100)?
A: Those are the classes that you'll make pieces from. They are begin "required" from pieces.

Q: Does pieces.rb require all the individual pieces?
A: Yes.

Q: What happens when a piece gets selected for movement?
A: High-level logic is in the game#play method, which calls player#move_piece.

Q: Is there a way to require_relative the contents of an entire directory?
A: There might be. Google it.

## Rspec

Q: Should we ask prospective employers how much they test their codebase?
A: Sure. If you do some research beforehand, you can ask more specific questions regarding testing, that will show you're interested.

Q: So, we test the public methods (not private) because people will be depending on them?
A: Yes.

Q: All of our private methods are used somewhere in public methods...So do we end up testing private methods?
A: No. You should just be testing the behavior of your code, without worrying about how it's implemented.

Q: What are other approaches to TDD?
A: I don't know if there are others that have names, but some people may write tests after they write some code.

Q: Why not just write great code in the first place and not have to refactor?
A: If you write perfect code, good for you! The most optimal solution is often the most complicated...Aim for solutions first, then make them more elegant/efficient.

Q: Is Cucumber something you should learn later? Is it more common?
A: I've never used it, so I can't give the best advice on that...I'd recommend learning front-end testing first.

## Rspec Demo

Q: Is this in Celsius?
A: That would be some very hot food. Hahaha.

Q: What is the scope of a subject / let?
A: It is the entire describe block.

Q: Should you write all descriptions then fill them in?
A: It's a stylistic choice.

Q: Since all of these tests can access the subject, why do you have this before_each block?
A: You're right, it's unnecessary!

Q: Does before take things other than each?
A: You can do before_all, and there might be others. Check the docs.

Q: Expect vs. should?
A: Should is outdated and deprecated. Don't write it, but know you may encounter it in the wild.

Q: Is a double just a simple object with a few attributes?
A: Yes. Exactly.

Q: String vs. symbols in "let"?
A: Either will work fine.

Q: Can you elaborate on calling methods within tests?
A: When you call a method on an object, the object is the receiver of that method. You must expect something to happen, and then make it happen in order for the test to pass.

Q: Why do we have separate eat and consume methods?
A: They are written for different classes.

Q: When do we make new context?
A: I want to do something that will affect all tests underneath the context. Think about what will make the most sense if someone if reading this as documentation or your program.

## Homework

Q: Why is the Chef class there?
A: The idea is that the Dessert class would in reality, work together with the Chef class. You could look at the Chef class to learn how its double should behave in your tests.

Q: What's require active/support?
A: It's for the pluralize method on line 33. You'll see more of this when you learn Rails.

Q: How do we test ingredients.shuffle? (line 20)
A: Just test the behavior of the code, not the implementation.

## Quiz

Q: Is there a rule for {} vs () ?
A: Use a block when raising an error, parens when you want to return something.

# Log

# 04/05/2017

Lecturer: Kelly Chung

## Questions

* Could a unit test rely on other unit tests?

Yes, you essentially could. You could have a test that depends on other
tests.

* Can there be overlap between unit and integration tests?

Yes. Write unit tests first.

* Should unit tests be replaced with integration tests?

No.

* Should I refactor before or after getting the tests to pass?

After.

* How do you know what to test if you haven't written the code yet?

TDD is an ideal. You might need to work through data structures or
implementation details beforehand.

* Why use context?

It provides organization.

* Will you go over a case where you need to use `after(:each)`?

No. Use it when you need to change the state of something after each
block.

* Will I have to reset things created with `subject` or `let` between
blocks?

No. `subject` and `let` do not persist state between blocks.

* "Should" should be used for other people's code, but not your own.

???

* Do `let` or `subject` persist between blocks?

Let persists. (Demo happens). Let does not seem to persist.

* Is it best to write methods for one method at a time?

Yes. Start with the smallest building blocks first and work from there.

## 9/21/2016

Lecturer: Quinn Leong

## w2d3 TDD Day

* Quinn takes roll.

## Chess questions
  - Quinn turns off the lights.

* Q: how do u do en passant even though it wasn't part of the assignment
  - Quinn: idk what that is. talk to me after

## Quiz

* Quinn reviews answers to last night's quiz

* Q: Did the quiz include a trick question? Are you trying to trick us?
  - Quinn: perhaps a little. (reviews the answer again)

* Q: there was another quiz we haven't gone over
  - Quinn: ok. (finds quiz)
  - Quinn: what is this on even? Want me to go through eveything ?
  - Students: (silent)
  - One student raises hand
  - Quinn: ask me after lecture if you have questions

## Mancala Questions

* Question about the hw repository
  - Quinn: yes put hw on github in the hw repository

* Q: what is convention for symbols
  - Quinn: use symbols for things that will not change over time.

## Rspec HW Questions

* Q: there was a lot of reading. must I remember it all?
  - Quinn: yes.
  - Student: it doesn't come naturally tho.
  - Quinn: be familiar with it. don't have to have it memorized

* Q: (very long, very quiet)
  - Quinn: describes how to test for equivalence with Rspec
  - Quinn: 'be' also kinda checks for equivalence

* Q: hw didn't have a gemfile. I didn't know what to do but things didn't work
  - Quinn: make a gemfile
  - Student: actually I had a gemfile (?) but it didn't work
  - Quinn: make sure to bundle install
  - Quinn: I will use a gemfile in the example. HTH  

* Q: can I just gem install individual gems
  - Quinn: yes, but a gemfile is better

* Q: is there a good way to test random functions? HW had us test shuffle?
  - Quinn: testing shuffle is difficult. Rspec is not perfect.
  - Student suggests to test multiple times
  - Quinn: validates student suggestion

* Q: in the readme it said something I don't understand
  - Quinn: that is for rails. it will be useful later

## RSPEC TIME!! ~~~~ *****

* Testing is good

* Q: when do we use testing
  - Quinn: AA doesn't do TDD because we move too quickly. But many companies do.
  - Quinn: lists companies that use TDD
  - Students: listen carefully

* Q: is there a way to run rspec ?
  - Quinn: gem install rspec and require it

* Pry is not as helpful as having tests already

* Rspec lets you do automated testing

* Quinn walks students through the Testing Pyramid
  - Quinn relates the Testing Pyramid to Mancala project

* How do I Rspec?
  - Quinn explains Rspec setup again
  - Student quickly raises then lowers hand. Their question has been answered before it was even asked!

* Quinn describes Basic Syntax
* Quinn describes Errors and reiterates 'be' vs 'eq'
* Quinn reminds students to check the documentation

* Q: how are things equal but not
  - Quinn: maybe they aren't the same exact object

* Q: how are we doing things to variables in rspec?
  - Quinn: You have access to variables in rpsec, but changes won't persist to your project

* Q: (the same question about using variables in rspec)
  - Quinn: rephrases original answer

* What if I have multiple subjects ?
  - Quinn: you can use two subjects if you give them two variable names. But this is not the best practice because there should be one subject

* When will things be overwritten in rspec?
  - Quinn: when they have the same variable name

* what is the difference between let and subject
  - Quinn: I have a slide! (describes the differences)

* Quinn explains Doubles (Mocks)

* Q: says something out of scope

* Q: what are mock side effects? How do I stop them?
  - Quinn: you have to tell mocks to return values
  - Student: how/ where does this work
  - Quinn: you can tell a mock to respond with a value that makes sense for your case

* Q: What does that mock test
  - Quinn: in this example, you are checking that a double receives a call

* Q: how does the mock know to listen?
  - Quinn: Must tell an object to listen for a method before the call

* Q: How would you check for types
  - Quinn: yes you can do type checking

* Q: how would you check value and type, other things?
  - Quinn: are you asking if you can have multiple tests in a block?
  - Student: yes
  - Quinn: we will try in demo

## Demo Time

* Quinn: shows students the gemfile per earlier questions
* Quinn explains requiring files in the spec file
* Quinn: what shall we call the sloth?
  - (immediately) Student suggests 'Herbert'
  - Students appear pleased with sloth name

* Q: what is the difference between bundle exec and just rspec
  - Quinn: use bundle exec on assessment, now I'm used to it. Ensures the correct version

* Q: should I save which version I'm using ?
  - Quinn: yes. A mystery TA (Brooke) broke her project after not specifying versions

* Quinn: what tests do u want for 'run'?
  - Student: raise an error
  - Quinn: yes. (writes the test)

* Quinn has a dangerous test that could pass when any error occurs. Shows students the warning message and makes the test safer.

* Quinn: What food do we give the sloth?
  - Student: LEAVES
  - Quinn: ok. (writes test so that eat expects sloth to eat leaves)

* Quinn explains private and protected methods cannot be called in tests
  - explains which methods to test: the API

## Questions

* Q: so we need the attr_reader in the class we're testing?
  - Quinn: yes. (shows students the reader in Sloth file )

* Q: do we test all public methods and their helper methods?
  - Quinn: test the methods getting called rather than potentially called helper methods

* Q: how/when do we use before each
  - Quinn: demonstrates an example

* Q: When do we use curly braces in rspec file
  - Quinn: it's a different way of writing a block

* Q: does a test only pass if all expects return true?
  - Quinn: yes. Demonstrates an example

* Q: how do you test a hash ?
  - Quinn: begins to demonstrate an example with sloth drinks hash
  - Student: GREEN TEA

* how do you can atom to add end and do blocks faster?
  - Quinn: I have a cool autocomplete feature that you can check out later

* If you wanted to check if an array is empty, how would you do that?
  - Quinn: can do 'to be_empty '

### Post-lecture

* five students linger near Quinn, presumably to ask more questions
