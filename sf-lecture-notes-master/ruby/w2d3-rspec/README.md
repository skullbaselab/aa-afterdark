# W2D3
---
# Intro to Test Driven Development and RSpec

Note:
Lecture Opening Music Suggestion:
Aretha Franklin's ReSPECt
https://www.youtube.com/watch?v=6FOUqQt3Kg0

---
# Congrats!

+ In less than 2 weeks, we've gone through:
  + Recursion
  + Git
  + Data Structures
  + OOP

Note:
These are concepts that are ubiquitous for any language anyone will be coding in the future.
Git: Learned how to document and share your code with the world

---
# Hack Academy Entries

Note:
Show some pictures from yesterday's CSS projects.

---
# Agenda

+ TDD Overview
+ Code Demo
+ RSpec Review
+ Quiz
+ Open Forum

Note:
Remind the group that questions during the presentation are for clarification purposes only.
Specific edge cases will be handled during the code demo.

---
# Learning Goals

0. Why do we test?
0. What is TDD?
0. What is the testing pyramid?
0. Be familiar with the RSpec library

Note:
By the end of the day, student should be able to answer these 4 learning goals.

---
# 1) *Why* do we test?

Note:
Best practice: Ask the class to share why since they should know from their hw

---
# Motivations

0. Checks if it works
0. Increase flexibility / reduce fear of change or refactor
0. Very conducive to collaboration
0. Produce documentation

Note:
Refactoring also includes  updating the code base to a new version of a language or package!

---
# 2) Test-Driven Development

TDD: a software development process

0) **RED** - run the tests after writing them
   	- screens for instances of false positives
0) **GREEN** - write minimum amount of code to pass tests
0) **REFACTOR** - make sure it's up to par with your company's style guide

Note:
True TDD is rare. It requires knowing exactly what you want at the beginning of the project, which isn't always the case.

In the project, you'll be rewriting parts of Towers of Hanoi.
If you don't remember the exact rules, don't waste writing the spec if you aren't completely sure what the method's output will be. In that case, write the method FIRST and then the test.

---
# TDD Benefits

0. Writing code that passes tests becomes easy: **you just wrote the test**
0. Only write code that is required: if it wasn't in your blueprints, *YAGNI*
0. Enforces modularity: testing suites will help monitor the app piece by piece
0. Code is *__read__* 10X more than it's *__written__*
  + Write your code to be understood and handled by others as well

Note:
YAGNI means 'ya ain't gonna need it
Times code is read by others:
- 2 times you refer to it
- 2 people for code review
- 2 times by yourself to figure out what you even did
- 2 other devs that need to know how your code works to refactor or add on

---
# *What* do we test?

---
# 3) Testing Pyramid

![testing-pyramid](https://2.bp.blogspot.com/-YTzv_O4TnkA/VTgexlumP1I/AAAAAAAAAJ8/57-rnwyvP6g/s1600/image02.png)

Note:
https://testing.googleblog.com/2015/04/just-say-no-to-more-end-to-end-tests.html

0. Unit Tests
  + Lots of these
  + testing a singular function with no relation to any other code
  + Example: Testing out the cursor class for Chess.
0. Integration Tests
  + A medium amount of these
	+ Example: Testing out if the board initialize method can populate with real pieces
0. End-to-End Tests
  + Only a few of these
	+ Example: Testing a round of chess. Can the program accept my input, can the program calculate my valid moves? Can the board move a piece.
0. Google uses the 70% unit tests, 20% integration, and 10% E2E.
  + the higher the test lies on the pyramid, the flakier, the slower, the more difficult it is to maintain over time.

---

# General Guidelines

0. Public API - YES
0. Private + Protected - NO

Note:
No need to test private and protected methods becase your public apis should be testing those methods under the hood anyways. If your public methods work, your private/protected should work too!
---

## Unit Tests

### FIRST

+ Fast
+ Isolated
+ Repeatable
+ Self-validating
+ Timely

Note:
http://agileinaflash.blogspot.com/2009/02/first.html
if you look at the pyramid there are tons of unit test. they should be fast. dont want them to be slow because there are so many of them!

+ Fast: 1/10 of a second is considered slow for unit tests
+ Isolated: Easy to find where the bug lies of a test fails
+ Repeatable: They must not depend upon any assumed initial state, they must not leave any residue behind that would prevent them from being re-run.
+ Self-validating: Either test passes or fails.
+ Timely: Tests are written at the right time, immediately before the code that makes the tests pass.

---

# Enter RSpec

+ Domain-Specific Language (DSL) written in Ruby for Ruby
+ Meta-gem that includes `rspec-core`, `rspec-expectations` and `rspec-mocks`
+ Other Ruby testing libraries include `Minitest` and `Cucumber`

Note:
http://betterspecs.org/
Meta-gem: A gem of gems.
---

# DEMO

Note:
+ Sloth Demo
+ Code and then refactor to make it better
  + locals --> subject, Fruit --> mock, local changes --> each, breaking
    error --> using block
+ Write the class first and then the specs for the first few methods.
  Then try TDD for the last few methods after they get the idea

---

# RSpec Review

---

# rspec-core

- structure
   - `describe`, `context`
   - `it`
- variables
   - `subject`
   - `let`
- macros
   - `before`

Note:
+ `describe` vs `context`
	+ no functional difference
	+ but there is a contextual difference
	+ describe is for class and method names
	+ context is for states, situations

+ `subject` vs `let`
  + `subject` of the class we are testing
  + `let` not the focus testing for.

+ `before`
  + `before` is a script runs before your it tests execute

---
# Pop Quiz 1

Anything wrong?
```ruby
### IMPLEMENTATION lib/dog.rb
class Dog
  def initialize(name)
    @name = name
  end
end

### TEST spec/dog.rb
RSpec.describe Dog do
	subject(:dog) { Dog.new("Henry") }

	context "#initialize" do
    it "assigns a name" do
      expect(dog.name).to eq("Henry")
    end
  end

end
```
Note:
`context` "#initialize" should be `describe` "#initialize"
---

# rspec-expectations

`expect(dog.name).to eq("Frank")`

+ left side:
   + `expect`
   + `.to`, `.to_not`, `not_to`

+ right side:
   + `eq`, `be`, `include`, `raise_error`, ...
   + `be_nil`, `true`, `be_truthy`, ...
   + `be_an_instance_of`, `be_a`, ...

Note:
Remind them in today's projects, use multiple types of comparisions, not just `eq`
expect will accept an argument () or block {}
`to_not` and `not_to` are functionally the same.
`raise_error` and `raise_exception` are functionally the same

---

# Pop Quiz 2

Anything wrong?

```ruby
### IMPLEMENTATION lib/dog.rb
class Dog
  def eat(food)
    raise "there is no argument passed in" if food.nil?
    "dog is eating #{food}"
  end
end

### TEST spec/dog.rb
RSpec.describe Dog do
  describe '#eat' do
    context "when there is no argument passed" do
      it 'should raise an error' do
        expect(dog.eat).to raise_error("there is no argument passed in")
      end
    end
  end
end
```

Note:
expect(dog.eat) should be expect{dog.eat}
---

## rspec-mocks

- fake objects
   - `double`

Note:
Go over method stub.
`allow` vs `expect`
---

## Pop Quiz 3
Anything wrong?
```ruby

### IMPLEMENTATION lib/dog.rb
class Order
  def initialize(customer, product)
    @customer = customer
    @product = product
  end

  def charge_customer(amt)
    @customer.debit_account(amt)
  end
end

### TEST spec/dog.rb
Rspec.describe Order do
  let(:customer) { double('customer', :money => 10.00) }
  let(:product) { double('product', :cost => 6.00) }
  subject(:order) { Order.new(customer, product) }

  describe "#charge_customer" do
    context "when there is enough money in the customer account" do
      it "charges customers will return the remaining balance " do
        except(customer).to receive(:debit_account).with(product.cost).and_return(4.00)
        order.charge_customer
      end
    end
  end
end
```

Note:
Method Expectations
Here we want to test that when we call `charge_customer` on an `Order` object, it tells the customer to subtract the item price from the customer's account. We also specify that we should check that we have passed `#debit_account` the correct price of the product.

Notice that we set the message expectation before we actually kick off the `#charge_customer` method. Expectations need to be set up in advance.

---

# Quiz Q&A

* [W2D3 Quiz](https://github.com/appacademy/daily-quiz/blob/master/ruby/w2d3.md)

---

# Tips for Today

0. Follow TDD! RED, GREEN, REFACTOR
0. only write unit tests
0. don't get too crazy with edge cases today
0. write a few tests, then implement code
0. CONSULT DOCUMENTATION OFTEN
   - RSpec docs
   - betterspecs.org

---

# Open Forum

---

### Questions from Yesterday?

[Chess Solutions](https://github.com/appacademy/curriculum/tree/master/ruby/projects/chess/solution)

---

# Homework Q&A

- [W2D3 Homework - Rspec](https://github.com/appacademy/daily-quiz/blob/master/ruby/w2d3.md)

---

# Thank You!

---
