**These notes are just a collection of bullet points found in old lectures. To prepare for this lecture it is best to have a good understanding of each OOP principle along with related definitions described in the agenda, the null object pattern, the singleton design pattern, exception/error handling and the AA chess project.**

11/21/16 notes:

**Expect questions on:**
+ module Searchable - can defer to lecture
+ `_children` - tells reader not to use with caution
  + as opposed to `children!` which would mean that this method modifies something
+ TTT - check if >50% of class got to TTT before answering questions

## Decomposition
+ we've decomposed complicated ideas into small methods before.
+ object decomposition is the same idea, but focusing on nouns.

## Abstractions / Information Hiding
+ hiding information allows your class to become more abstract - an interface.
+ this is a key part of what allows OOP to be beneficial: it allows internal refactoring.

## Encapsulation
+ each object should only know and manipulate its own data.
+ if an object wants to change another object's data, it should send a message.

## Polymorphism
+ using an interface to handle different data types.
+ e.g., 1 + 1, "hi " + "friends"

## Duck Typing
+ allows us to avoid type checking.
+ e.g., HumanPlayer and ComputerPlayer

## Null Object
+ an example of duck typing that allows you to define a null behavior
+ will be used today to manage empty squares on the chess board

## Singleton
+ used when you want at most one instance of a class (and also helpful for equality checking and global access).
+ e.g., databases, loggers, NullPiece
+ http://www.allapplabs.com/java_design_patterns/singleton_pattern.htm

## Inheritance
+ lets up stay DRY

## Super / Sub / Include / Extend / #extend
+ show animals demo

## Exception
+ syntax: `raise ErrorClass.new("message")`, `begin` -> `rescue` -> `retry` -> `ensure` -> `end`
+ show error demo

previous notes:

# Inheritance
* inherit from classes with `<`
* purpose is to remove code duplication
* super methods called with `super` no args==parent methods args
+ sub classes 'inherit' all behavior from parent class
+ can add methods to sub-class without changing parent
+ methods defined on subclass 'override' parent
+ call original method using `super`
+ useful for eliminating duplication

# Exceptions
* point is to stop execution and inform of an exceptional state
* `raise` or `fail` to throw an exception
* exceptions bubble up if not caught
* `begin` `rescue` and `ensure`, `ensure` runs no matter what hapened
* can put a `retry` in the rescue block to run again from the `begin`
* can have multiple `rescue` blocks to handle different kinds of errors
* don't catch all exceptions, they are essential for writing robust code

+ when exceptional state occurs, stop execution
+ will kill entire program if not _rescued_
+ `begin`, `rescue`, `ensure`, and `retry`
+ can `rescue` certain exceptions or all
+ can have multiple rescues to capture different kinds of exceptions
+ ensure ALWAYS runs wether an exception occurred or not
+ `fail` to manually raise exceptions (also `raise`)

# Object Decomposition
* for any program, the *nouns* should be the objects
* each class should do one thing
* ideally, changes to one class shouldn't necessitate changes to another
* 100~ lines of code for classes
* resist temptation to make god classes
* organizing classes is hard and takes a lifetime to master

# Inheritance and DRY
* Subclasses are cool, but don't add them if they don't need to be added
* They must have things in common to need a common ancestor, but have diff
  behavior.

# Information Hiding
* we can make things `private` so they are only accessible inside the class
* minimize interfaces: less to change

## Encapsulation

+ packaging data and methods into a single component (classes)
+ objects provide interface to interact with (private/public)
+ internal state is hidden, allowing refactoring
+ strive for modularity - swap it out with another

## Polymorphism

+ different objects responding to the same messages (method calls)
+ can use different types interchangeably, can be agnostic of type
+ ruby has 'duck typing', doesn't check type, just sends message
+ imagine a car and driver, driver could be android, car wouldn't know

## OOP - Strategy
+ *nouns* are the objects (classes)
+ classes do one thing, one thing only
+ classes shouldn't be closely coupled,
  changing one class shouldn't necessitate changing another
+ no god classes, keep an eye on creeping of size/breadth
+ it's hard, try and stick to principles and refactor constantly
