# 03/02/2018

Lecturer: Andres
Scribe: Aaron

## Questions

+ Is this similar to monkey patching?
+ Do we have to put a receiver on the `class_eval`?
  + Great question, we needed to do it above to have this accessible
    to every class, but in this case we want it to be evaluated on `self`
    so we can explicitly call it to make it clearer?
+ When you called `instance_methods`, why was the argument `false`?
+ Why is it changing the scopes in the `attr_accessor_lite`?
+ Would this work on all of the ancestors?
+ Will it work on a hash of a hash? If we wanted to access a nested value
  + Great question
+ Would it be valid to map over the keys and use an `attr_reader` on them?
+ Could we recursively call our method if the value is a hash?
  + Definitely!
+ What about name collisions?
  + Yes, we will overwrite the methods and there is a way to do this.
+ Is using `send name` the same as `send(name)`?
  + Yes
+ Should we pass the send arguments?
  + Yep!
+ Is that making `@@counter` a global variable?
  + To make it globally available, we would need to use `$`

# 12/22/17
* Lecturer: Stephen
* Scribe: Andres

### Questions
+ Is startsWith() a built-in method?
  + Yes it is, we can go to the String Ruby Documentation to check it out.
+ Is there a define_class?
+ Is there a need for requiring the active_support reflector.
  + Because we are not using rails, we do need to have it in the Gemgfile and require it.
+ If you dont pass the symbol, will it still work?
  + Only if you passed it as a String.


### Notes
 + Isn't it introspection rather than reflection? Apparently they are the same term, lets try to stick with one. Or let them know we will use it interchangeably.
 + Lets give a concise example on the method missing and use it to go over the code. Maybe step through with a debugger?

# 10/20/17
Lecturer: Stephen
Scribe: David

## MetaProgramming

### Questions

+ What's the difference between compiling and interpreting?
+ If you have an instance of a class, and then you use `define_method` to define a new method on a class, does the original instance have access to that new method?
  + yes
+ Where is `define_method` defined?
+ If you use `attr_reader` and define a "reader" method, manually, what happens?

# 8/18/17
Lecturer: Kelly
Scribe: Anastassia

## MetaProgramming

### Questions
+ If you're doing eval(x), you're letting the user put anything into your string, isn't that bad?
  - YES, Absolutely. A malicious user can inject dangerous code.
+ Doesn't pry use eval every time you hit enter?
  - I'm not sure, but maybe. That's a good use case for it, but as developers we won't use it.
+ In the readings it says Rails 5 doesn't support finder method?
  - I'll check that. But this code, regardless, will be in legacy codebases.

```ruby
class Array
  def method_missing(name, *args)
    if name == :len
      self.length
    else
      super
    end
  end
end
```

+ How is super able to call its parent method, when we might be overwriting its parent method?
  - Keep in mind method_missing is still on the Object class. We are just monkey-patching the Array class.
+ If I call super here, is it referring to the Class object, or the Object object?
  - Array is inheriting from Object... I'll investigate that later and let's figure it out in open forum.
+ Class instance variables?
  - Are denoted the same way instance variables are, but are in the scope of the class only.

## Demo
+ Are private methods like the IP of the app?..
  - If your code is served up to a client, don't consider it private.
  - Yes, private methods can be hacked with :send, but actually private methods will be prevented by Rails from being served up to the user.
+ It's only at run time of this app that I can see this method is defined.
+ How is it possible that I can create "tricks" in the public/private. Access modifier.
  - If you guys are interested in access modifier, talk to me.

## Quiz
+ If I have 1 @ sign, its only in the scope of that class instance, but if you have 2 @@ signs, its functionally different.
  - Yes, with @@ all instances will have access.
+ Can a define method ever define a class method?
  - Perhaps.. In fact, there may be a define class method. Nope (looked it up). But technically yes, if you define it on the class class.

## Open Forum
+ The definition of metaprogramming is simply a program that can inspect and alter itself.
+ If we call super in method missing, does it call Class or Object?
  - (Tests in pry) Likely Object.

# 4/14/17
Lecturer: Luke

## Projects
+ associations in the Polls App solutions don't have everything filled in
  + Rails will be guessing using a set of defaults; we teach you
  everything because it's good to know
+ why require uniqueness at both model and database level? why indexes?
  + belt-and-suspenders approach; occasionally only validate at model
  level in cases where it's very hard to make constraints
  + indexes are necessary to speed up the uniqueness check
    + do you use the index or does it operate behind the scenes?
      + you will never reference the index directly; it works behind
      the scenes. indexes are auxiliary data structures and don't
      change the original data.
    + where put the option to enforce uniqueness?
      + uniqueness goes with the index; presence goes on the column definition
    + pass in an array to add_index
      + makes it fast to search for the combination of two things
    + uniqueness on the model vs. database level?
      + they enforce the same thing but in different parts of the program
    + does adding an index make it more expensive to update things?
      + yes, probably. don't use them unless there's a good reason.
    + why does add_index not automatically require uniqueness?
      + indexes don't need to enforce uniqueness.
    + how much indexing is too much indexing?
      + index keys for associations (foreign keys) and things that you
      will be searching for often
    + how would we set up uniqueness without an index?
      + why? you could probably do it using SQL (not in a migration)
+ what is a b-tree and do i have to understand it now?
  + you don't have to understand it now.
+ select and joins vs. includes?
  + joins allow you to use that data in your query but don't return it
  to you; includes will return you that data
+ ??
  + don't iterate over a collection and make a query for each one
+ can you use raw SQL in AR methods?
  + sounds like a specific problem
+ ??
  + ?? sounds like a specific problem
## Quiz
+ ??
  + scope means what methods and variables are available to you -
  instance scope vs. class scope
+ what is the argument for define_method?
  + the name of the argument
+ is `def` short for define method?
  + they have the same effect
+ define_method and def do the same thing?
  + yes
+ is metaprogramming slower?
  + in ruby everything happens at runtime anyway; it might be slower
  but i'm not sure
+ because define_method is defining a method, is it the same as def?
  + again, they have the same effect
+ self.define_method ... ?
  + i would guess that it would do the same thing - test it!
    + yes, i think it would
      + yes, i think so too
+ so you put a block in there?
  + define_method is actually running some code - it's a method i'm
  running inside this class
+ if you want to pass in arguments to send?
  + comma-separated arguments
+ strings vs. symbols in metaprogramming?
  + ruby handles them the same
+ send will call a private method?
  + yes
+ class variables are inherited?
  + yes
+ does dog get the class variable from huskies?
  + no, don't think so
## Homework
+ everything
  + *laughs*
+ objects are instances of classes, but classes are objects?
  + yes, classes are instances of the Class class
+ macro is a class method that defines more methods? can it also be an
instance method that defines more methods?
  + yes; don't think so.
    + reading says it can?
      + might, then
+ when does ruby define class methods?
  + before any instances are created
    + so Dog.new will create all the class methods?
      + kind of
## Metaprogramming
+ is it coincidence that `eval` is one letter away from `evil`?
  + ponerology is out of scope for this lecture
+ when would we need to use instance_variable_get/_set?
  + dynamically get & set variable when you don't know ahead of time
  what the name of the variable is
    + so under the hood AR is already using this stuff?
      + ... you're building AR today
+ do you have to have setters and getters to use the ivar methods?
  + no
## Demos
### Demo1
+ could you define these methods on the class?
  + yes, and i'll prove it as well
    + how does d know about this new method?
      + an object looks at its class to see what methods it has
### Demo2
+ instances don't carry around their instance methods?
  + yes, the class hold the methods, the instance has a reference to the class
    + if you change the definition of a method, it'll change?
      + yes
+ why a class method that makes a method and not an instance method?
  + because these changes should take place class-wide
### Corgus
+ fix typo
  + yes, very good
+ other typo
  + thank you all very much
+ other typo
  + tha- actually it's not a typo
+ extending modules?
  + takes methods from modules and makes them class methods
    + vs. including modules?
      + takes methods from modules and makes them instance methods


# 2/10/17
Lecturer: Gage

## Yesterday's Project
 * Gage directs students to the ActiveRecord docs

## Metaprogramming
* Something about scoping
 * We're dealing with both class scope and instance scope. The block inside `define_method` happens in instance scope, everything else is in class scope
* If we create another dog object, will it also be able to meow?
 * Yes
* Does this only persist over the session?
 * Yes. If we want to persist new methods we put them in the class code
* Sometimes you define method names as strings and sometimes as symbols. Does that matter?
 * You can do both
* Don't method names automatically get saved as symbols?
 * Yes. Ruby likes referring to methods as symbols
* Is `define_method` a class or instance method?
 * Class. Only the code in the block is in instance scope
* In an instance scope that hasn't been created yet?
 * Yes
* Can `define_method` also be an instance method?
 * No
* Does `instance_variable_set` create a new variable if it doesn't already exist?
 * Yes. If we use it we can interpolate into the name of the variable
* Why do we need an `@` in the instance variable name?
 * We just do
* Is `instance_variable_set` a regular Ruby method?
 * Yes
* Can we write getters and setters like this?
 * Yes, you'll do it in today's project
* Is this how `attr_reader`/`writer`/`accessor` work?
 * Yes, again you'll see that in today's project
* Is this a way to DRY up subclasses?
 * Yes
* If we set an instance variable inside a class methods, what is it affecting?
 * Remember that we're in instance scope when we set the instance variable
* Can you make these methods private?
 * Yes, but don't worry about it
* We use `||=` in the `cargo` method to prevent overwriting cargo, right?
 * Yes
* How would we create an `attr_reader` when running `instance_variable_set`?
 * Out of scope
* So the code in the block is the instance method and the variable in the pipes is the argument?
 * Yes
* Would re-running `mount_bays` also redefine all the cargo methods?
 * Yes, and `@cargo` might already exist but that's okay.
* When we call a class method, is what's in the `define_method` blocks getting run?
 * No, it only gets run when we call the instance method on an instance of the class
* Are there any side effects to redefining the cargo methods?
 * It's not optimal, but it's okay
* Could you set up methods without passing a block to `define_method`?
 * It might take procs, but it needs to have some kind of block of code to set up as the instance method
* Could we just set up the cargo as instance methods?
 * Yes
* What's the advantage of defining them in `define_method`?
 * It's a demo of metaprogramming. They're functionally equivalent
* When do the methods get created and when does the code in them get created?
 * The code inside the block and the instance variables don't exist until we call the class method to define the instance methods
* If we redefined a method with new code, what would happen?
 * We would overwrite it
* If we made a subclass would it inherit its parent's instance methods?
 * Yes
* What's the difference between `extend` and `include`?
 * `extend` makes them class methods, `include` makes them instance methods
* What if we defined class methods in the module?
 * That's kind of weird, use `extend` vs `include` to decide what kind of method it is

## Quiz/HW
* What's going on with `grep`?
 * It's using regex, don't worry about it too much for now
* How does `send` work?
 * First arg is method name, next args are any args the method would take
* Could you set up some kind of control flow in `method_missing`?
 * Yes, you want to control it carefully because `NoMethodError`s are helpful
* Would we also want to be careful with `define_method`?
 * Yes, but it's already more restrictive

## Other
* Is it okay to talk about stuff with people near us during solo days?
 * Definitely

# W3D5

## 9/30/2016
Lecturer: Jeff Fiddler

## Questions/Comments from yesterday's assignments
  * ActiveRecord project
    * Why was ActiveRecord project so difficult?
    * Would have been useful to have readings or videos on ActiveRecord
    * Maybe we (students) could have started with easier problems and then done harder ones
    * How does includes work? Is it a join?
    * Is there functionality from ActiveRecord that we can't get with SQL?

## Questions/Comments on Quiz
  * Do you need to put define_method inside method missing for it to work?
  * Can you define a class method in class_eval?
  * Class_eval and instance_eval not covered in readings

## Questions/Comments on Homework
  * Homework link was broken
    * Folders still in github. README.md filename was changed when
      homework was updated the day before.
  * What is grep and how does it work with Ruby?

## Questions/Comments from lecture
  * If we define method_missing inside parent class does child class have access
    to it?
  * Confusion about instance variables versus local variables in self.install_thruster method
  * Can you use define method to create methods with defaul inputs?
  * Why do you not use parentheses to invoke methods in Ruby?
  * When does attack_cannon run? Before or after instance of class is created?
  * Why don't we overwrite initialize method in CerealShip class?
  * How does attr_reader work?
  * How do protected and private scopes work?
  * Can define_method deal with symbols and strings?
  * Attr_reader, writer, accessor are great methods. Are there other methods that are
    baked in that we should know?

## Other Observations
  * Jeff mentioned that Active Record makes for less brittle
    queries, and that's why it makes sense to use it
  * Students said it would be nice if class_eval and instance_eval
    were mentioned in readings
  * Students requested lecture on computer setup
  * There seemed to be confusion about how define_method uses
    block variable


## 7/29/2016

Lecturer: Jeff Fiddler

### Questions
* Can I just use heredocs for everything instead of ActiveRecord queries?
* Can you give an example that works in one SQL engine but not another? (JSON in postgres but not SQLite)
* Could you explain includes?
* What are N + 1 queries?
* Why can't you call Poll.questions.whatever?
* OK to build a mega join table?
* When you write a has many through association, are you performing one query or two queries?
* Quiz - which one prints out class Corgi and which one prints out instance of corgi?
* Difference between class_eval on corgi and monkey-patching corgi?
* Does calling instance_eval create an instance method?
* What is method_missing?
* Why not just set cargo hash in initialize? (Lazy initialize - no need to create instance variable if you don't need it.)
* Do you have to access cargo using the method we wrote, or can you just say `cargo = {}`? (Local variable vs. setter methods)
* Why did you put 'base' in the name? Is that a convention?
* Where is the argument coming from in `define_method`?
* Does instance_variable_set require an @ symbol?

### Mistakes
* Students did not see readings quiz questions - very low score
* Assignment doesn't actually use `instance_eval`, `class_eval` methods

### Notes
* Thank goodness no love thrusters
* Yay interactive quiz at the end for class vs instance scope! :D
