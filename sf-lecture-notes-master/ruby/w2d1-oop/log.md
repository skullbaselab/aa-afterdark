# W2D1 Notes

## February 19, 2018
* Lecturer: Tommy
* Pair: Aaron
* Notes: (Isak)
* Topic: OOP

## Lecture questions
* Where does `require` look?
  * Dismissed
  * If you are loading a gem, use `require`; if you are loading a file you wrote, use `require_relative`
* How do you remove stuff loaded into pry?
  * "I don't know, if I needed it I would Google it. I've only used it twice in 10 years."
* Does `super` go up through all superclasses?
  * No, it only goes to the most immediate superclasses.
* Does the order inside of `initialize` matter?
  * Yes it does, if you want to override anything from the superclass, it needs to come follow lexically.
* Do the instance methods 'live' on each instance?
  * No, the instance holds a reference to the class and they live there (sort of).
* Can't we just `reload` in pry (for required file)?
  * When you reload a file in pry, the files that it requires will not reload.
* So private methods can only be called implicitly?
  * Yes, no receiver.
* (inaudible, private vs. protected)
  * A private method is only callable by an instance
  * A protected method can be called by members of the same class
* Private is not about security, what about protected?
  Nope. Same.
* What is the difference between `NoLegError.new` and (trailed off)
  * Something about `e.message`, I don't think it was really answered.

## December 11, 2017
Lecturer: David
Notes: Cynthia
Topic: OOP
Song: Britney Spears - Oops!...I Did It Again

### Notes to future lecturers!
* Make a distinction between `require` and `include/extend`
* Look back at last week's projects because the students will refer to them.
* Put everything in the context of the Chess game that they will be building.
* Potentially include a quick roadmap of what happened last week and then what will happen this week. (simple games last week, more complicated ones this week i.e. Chess + Poker. These games are more complicated than A02, but will prepare them well.)
* The second half of the slides are less cohesive than the first half. Make sure you have a logical progression from each concept to the next. (i.e. modules are another way for classes to "inherit" functionality. Not sure how to logically progress into the Errors section...)

### Lecture Questions
1. Since `cat` is a keyword, can we create a `Cat` class without any problems?
    * For other some programs, yes. Don't make a "Cat" object in sql. In ruby, it's fine.
2. When will you know when to use class vs. instance methods?
    * If it doesn't use any instance variables, most likely it is a class method.
3. What is a classic example of a class method?
    * Factory methods! They are specific class methods that create instances.
    * Create class constants. Create a class method to access those class constants.
4. What if I wanted to make class methods to created easy, medium, hard versions of chess.
    * You can!
5. Can I create a class that only contain class methods and no instance methods?
    * You would be creating a Module
    * `Math` module
6. Does protected worked for sub classes?
    * Depends on parent. Generally, yes
7. Which methods have access to can use private methods?
    * private method can only be used inside the same class!
8. What is the purpose for public vs. private methods?
    * Comes down to coupling and interdependence.
    * By explicitly saying this code is private, you and other coders don't touch this private code!
    * Everything should be private unless you have a GOOD reason to make change it to public.
9. Everything we have been written was public so far. Why are we starting to consider public/private in our implementation?
    * In Minesweeper, we had private methods! Minesweeper#play is public. The method will call on Minesweeper#get_move, which is private.
10. Are Ruby methods default-ly public?
    * Yes!
11. If we had two instances of 'A' and 'B' of the same class. Can instance 'A' access instance 'B' methods?
    * Yes! We can access its protected methods.
12. When and why would you declare a section of code private and then switch to public?
    * This is just a toy example. Just letting you know you can switch between one or the other.
13. In other languages will repeat code if inheritance is not allowed?
    * Most languages do. Example. C does not. In C, there are no classes for you to to inherit from!!
14. Is their a ruby convention where `super` appears at the top or bottom of the method.
    * Usually see it on the bottom.
15. If you want to use the parent's version of methods implementation on the child, what do we do?
    * don't declare on the child class. it will default to the parent class.
16. What is the difference between require and include/extend?
    * require loading that module/class/whatever into the global name space.
    * you are creating a constant that is a reference to that model.
    * however you haven't included into any class
17. What is the reason for having a Loud and Soft Module vs a Loud Animal and Soft Animal
18. What is the big difference between module and classes?
    * Module do not have instances.
    * Ruby, class can only inherit from ONE OTHER CLASS.
19. You can override module methods. Can you invoke with super?
    * super will then
20. Order of the ancestor chain is important. `super` will only be called on the its first ancestor.
21. What if animal also had a do_stuff method? Would `super` call multiple methods?
    * No, it will only go up ONE LEVEL.
    * It does not bubble up.
    * You will need to write in super in every method if you want it to bubble up.
22. When you create a board, when will you use a null object?
    * only on the empty squares, you fill them up with null objects.
    * you don't need to check if anything is nil in the board.


### Exception Demo

1. With retry, when will the ensure still run?
    * Even if you force quit, ensure will still run.
2. Is power_level defined in the ensure block?
    * Yes. It is defined in the begin/rescue/ensure block.
3. If your error matches multiple errors? Which rescue block will be executed?
    * try on pry!
    * it will run the FIRST standard error block.

### Quiz Questions
* none!

### Notes for David
* Woohoo! repeated students questions :)
* Voice projected well :)
Suggestion: Tie more examples towards today's project. Chess. For example, when describing Duck Typing, how is duck typing relevant in Chess?

## Immediate Action

----------

## August 7, 2017
+ Lecturer: Stephen
+ Scribe: David

### Lecture Questions

1. Can you explain the difference between public private and protected?
  + public methods are available anywhere.
  + private methods are only available inside of the class in which they are declared.
  + protected methods on an instance can be accessed by any other instance of the same class, whereas private methods can only be called by the instance it belongs to.

2. Is there a distinction between state and actions?
  + State refers to all of the variables currently set.

3. Is the interface of an object defined by its public methods?
  + Yes

4. If `attr_reader, attr_accesor` are below `private`, do the methods they create become private?

5. Are modules inherited by children of classes that include/extend them?
  + Yes, unless you call extend on an object instance.

6. Modules don't have state?
  + Right.

7. Would you say that the difference between `::include` and `::extend` is similar to the difference between `public` and `private` methods?
  + No.

8. Please demonstrate how `#extend` works

9. Can you rescue multiple different types of errors?
  + Yes, just use a rescue statement for each error type.



## August 7, 2017

+ Lecturer: David Dobrynin
+ Scribe: Kelly Chung

### Lecture Questions

1. Can you repeat the part about not allowing object to reach into other
objects
  + Sure - *re-explains*
1. Can we just call includes on the long list of methods
  + Yes, but there's a better way: `x.class.instance_methods(false)`
1. What does it mean when we say protected methods can be seen but not
used?
  + Protected methods are visible after calling `x.methods`, but still
  operate like private methods otherwise.
1. Can you have a line of subclasses of subclasses of subclasses?
  + In that way, you can have a GrandParentClass, but a class can't have
  two direct parents.
1. What if they accept different numbers of arguments?
  + Then you're probably doing it wrong
1. If a the subclass' definition of the method takes in the same
arguments as the parent class, do we not have to do anything?
  + Yes, if that's the intended behavior
1. If you `retry` over and over again, will the code in the `ensure`
clause run as many times?
  + It will run once after the loop of `retry`ing is over
1. Does retry only work once?
  + Nope, retry will happen over and over again until it works out
1. What happens if you don't `rescue` the program?
  + If you don't rescue, it'll break the program
1. Can you go through the inheritance chain again?
  + *demonstrates*
1. What happens if you call super inside super?
  + Not sure.

1/3/2017

Lecturer: Jenn
Scribe: Luke

### OOP

- Should we break something up when we want the same method to do different things?
- What does it mean to hide implementation details from the user?
- When to use private vs. Protected?
- Why do we want to hide information?
- What's the principle for constraining what type of object can use a method?
- If we plan to duck type, should we also use a module?
- Give an example of duck-typing
- Is `nullPiece` similar to just passing in `nil` for empty spaces?
- If we just used `nil`, we would have to check for `nil` in each method, right?
- Could you use singleton if each pace had to store a position?
- How to swap pieces?
- So, board knows positions, but pieces, don't?
- Defining classes: runtime or compile time?

### Demo

- How does Duck know what title is?
- Can you think of a module as being part of the class?
- Why did you use symbols instead of strings?
- Which take precedence? Sub or super class methods?

### UML Diagram

- What do unlabeled arrows mean?
- Modules vs classes?
- In the real world, do people draw UML diagrams?
- How do you figure out what classes you need?


# 1/30/2017

Lecturer: Gage Newman
Notes: Robert Koeze

## Question from previous day's projects

* How does the dfs work with prc? How is the value passed down to each call?
* Is it usual to put all instance variables in the constructor?

## Questions from lecture

* Is Javascript a functional language?
* Are there other ways to do polymorphism other than duck typing?
* Is a logger a lazy loader?
* Is a singleton the same as a null object?
* Will any classes ever inherit from a Singleton object?
* How do we get `nil.class.singleton_class?` to return false
* Does everything inherit from object?
* Does Ruby cast? Student compares to Java.
* Does the method initialize use super?
* How is super implemented?
* How do you decide what's a parent class? A child class?
* How do you extend a module?
* Is there a way to mandata that a child class implements a specific method.
* If we make a lot of animals, do we include modules in the Animal superclass?
* Can you include part of a module but not an entire module?
* Do we write multiple modules in the same file?
* Do we use parentheses with `extends` methods?
* Can a module have a parent module class?
* Can you extend a module inside another module?
* What is the two colon syntax, i.e. `Class::Constant`?
* When you call raise with a string does it work the same?
* What's the difference between `raise` and `rescue`?
* Do you use ensure and retry in production level code?
* What's the difference between protected, public, and private?

## Questions from the quiz

* What's the difference between super that takes arguments and super that doesn't?
* Does the underscore used with numbers, i.e. `10_000`, do anything special?
* When do we not have a `begin` keywork in error handling?
* Does notation for saving errors, i.e. `=>`, something specific to saving errors?

## Questions from the homework

* Why do we want to start sequence length of 1 when the sequence is actually empty?
* What does `%w(red blue green yellow)` do?


# 11/21/2016

Lecturer: Gage Newman

# w2d1

## Agenda
* Questions from Friday's assignment (10 min)
* Quiz Solutions (10 min)
* Today's Material (45 min)

---

# What is decomposition

* Gage gives a paper clip to the student who answered correctly. Starts talking about Sharks and Minnows.

---
# What is Abstraction/ Information hiding

* crickets
* Gage draws class relationships on the board. There are circles and arrows.  

---
# Encapsulation

* Students correctly guess the answer. Or at least the mumbles seem to be the correct answer.
* Why we want to have getter and setter methods. Gage confirms that students understand what is going on.

---
# Polymorphism

* Gage starts to note that students might not know the answer. Suddenly a dark haired student in the back shoots up his hand and answers 'POLYMORPHISM'. The crowd is silent.
* After some discussion on classes a student asks "Is there a specific term for classes that are built into Ruby versus not built into Ruby."

---

# Duck typing

* if it looks like a duck ....

---

# Null Object Pattern
* Gage draws a 'bishop he guesses' and students laugh. Then he explains how not to write chess.
* Question by student is posed, Gage responds with "Trust me: not really".

---
# Singleton

* Can you go over an example where it might be useful to use a Singleton? Gage quickly answers that Singletons would be great for Database connections or Loggers. Then he relates it back to our desire to use a Singleton for empty spaces in chess.
* What happens if you try and call `.new` for a class including the Singleton module?  Gage notes that `.new` will throw an error because it is made private when including the Singleton Module.
---
# Inheritance

* Gage notes "Inheritance is one of those things that always use to stay DRY" - if only they had known this weekend.

---
# Parent/Base/Super Class
# Child

* Student asks: 'Can a parent class also inherit from another class'. Gage deftly shows the ancestry of a FixNum in pry.
* Another student ponders if you can have more than one direct parent class. Gage shuts down such a possibility and notes he will return later to mixing in more method options.

---
# `Include`
# `Extends`

* When do you want to `extend` versus `include`? Gage 'dips his toes in' to answer in a general manner for instances versus class methods.
* Student wants to know if a class is just a type of Module. Gage swats it away - noting that he will get to Modules in a few minutes.
---

# Demo

* Gage walks through his Modules `Quiet` and `Loud`. His class `Sloth` includes `Quiet` while `Elephant`, `Whale` and `Bear` include `Loud`.
* Students look fondly on _Slo Bro_, _Jumbo_ and _Free Willie_.
* Student quickly squeaks out a question about calling `class`.
* Gage rushes out the sentence "Slo Bro the sloth quietly sits".
* Gage shows a gross code smell that shows up when you try to load a module twice

---
# Raising Exceptions

* Students question different ways to raise errors. Gage imparts his wisdom on setting error types.
* Gage shows off his demo in response to more student questions.
* Students are intrigued with `EngineStalledError => e`

---

# Chess Diagram

* Gage walks student's through the set up - he gives students the option to ask questions.
* Student asks if they should draw their own diagram. Gage says that would be a good idea.
* Question about Null pieces - when you remove a non Null Piece from the board do you replace it with a `NullPiece.instance`.

---
# General questions
* Student ponders how to make the `NullPiece` class with the Singleton. Gage reminds everyone that because of Duck Typing we want to be able to call the same methods on a Null Piece without throwing an error.

---
# Quiz

* Students are confused about super implicitly getting arguments from initialize when none are passed in.  
* Student asks what happens when both parent and child class have the same method name but the child class doesn't call super?
* Student wants to know if `TypeError => e` is the only way to save `e`.
* Students sort out how private/protected methods work.


# 9/19/2016

Lecturer: Gage Newman

### Questions

* Is is common to start a protected method name with an underscore?
* What's the difference between private and protected methods?
* Can a class inherit from multiple classes?
* Does ensure still run even when something executes successfully?
* Can you store a counter in the error class to count the number of errors?
* Can you provide some examples of when singletons are used?

# 7/18/16
Lecturer: Kevin McCall

## Common Mistakes
- parent= method
- dfs explicit return in each method

## Questions from Yesterday
+ what is the _ variable?

## Quiz Questions
+ Q1: why is it "Swing" if we're calling super?
+ Q1: is there any way to ?? ??? ?? (something about passing parameters)
  + something something parentheses stack overflow
+ Q1: what would be swing.form after you initialize it?
+ Q2: does retry continuously retry or does it only do it once?
  + isn't that weird? (not sure what he was talking about)
  + wouldn't your (Kevin's) example always raise an error?
    + will the retry happen before the car stops?
    + so if drive_car doesn't raise any exceptions, then it'll skip the two rescues and puts "Car stopped."?
    + don't you need to pass parameters when you call super?
    + something something infinite loop?
    + how would you indicate that you want to not retry past a certain point?
    + (unknown question about types of errors)
    + so if there was another error other than the two that are rescued, would it still puts "Car stopped."?
    + what is the scope of the errors - can they access everything in the method?
      + can rescuing an error allow you to capture a snapshot of what was happening in the method to cause the error?

## Lecture Questions
+ what's the difference between abstraction and black box methods?
+ namespacing?
+ (unknown question) - answer was about extending vs. including and methods becoming instance methods or class methods
+ could you write a module that has both instance methods and class methods?
+ (??)
+ if you call .extend on a particular instance, then only that instance gets those new methods?
  + if extends usually provides class methods, why does it add instance methods to a particular instance?
  + can you call .include on an instance?
+ but what if there are many null pieces - can you still use a Singleton?
+ how do you initialize a Singleton?
  + would you use a Singleton board in a chess game because there's only one board?
  + so Singletons are just used to save memory?
  + so can you store data in your Singleton?
  + (unknown question about using a Singleton instead of nil)
  + (unknown question) - the board has to know the different positions
+ if there's a name collision between a method in your class and a method in a module, who wins?
+ would you ever call a module by its name (e.g., Cursorable.method)
  + what if the name collision was between two methods inside two different modules?
+ DIAGRAM: actually not too many questions, surprisingly
+ when designing a big OOP program, do we start at the top or at the bottom?

## Notes
- Talk about a manifest file when reviewing the chess UML