# W2D1
#### (OOP!... I did it again)

---

### One Down, Five to Go!

---

### Learning Goals

1. Learn OOP vocabulary
1. Become familiar with OOP design patterns
1. Become familiar with exception handling

---
# Don't worry
+ After today, we do NOT expect you to suddenly be able to create entire applications by yourself.
+ It will come with time and practice.
+ You will understand gradually with experience.
---

### What is object-oriented programming?

* A _programming paradigm_ based on the concept of _objects_
* Objects contain data
* Objects have methods
* Methods can access and modify an object's data.
* Objects can interact with one another via their methods.
---

### Objects

+ Objects store data as `instance` variables
	+ `@variable_name`
+ Objects access data via methods
	+ `some_object.some_method`
+ Some people think of OOP in terms of sending messages
	+ `some_receiver.some_message`


---

## Why OOP?

---

## Why OOP?

- reduces complexity in large programs
	- "...closely reflects the structure of systems 'in the real world', and it is therefore well suited to model complex systems with complex behaviours"

---
## Coupling and inter-dependence
  - coupling: when one code module modifies or relies on the internal workings of another module.
  - a change in implementation of one module might affect another module.
  - tightly coupled code is difficult to reuse, test, and refactor

---

## Principles of OOP

+ Encapsulation
+ Abstraction
+ Inheritance
+ Polymorphism


---
### Encapsulation

+ The bundling of data and the functions that use and manipulate that data

+ The internal data and logic of an object are hidden. Other objects can only access an object's public methods.
---

### Abstraction

+ Objects represent abstract “actors” that can perform work, report on and change their state, and “communicate” with other objects in the system.

+ Allows us to think about objects in terms of their interfaces and functionality, instead of their implementation details.

---

### Encapsulation and Abstraction Demo

---

### Polymorphism

+ The provision of a single interface to entities of different types.
	- Example: `Hash#each` and `Array#each`

#### Duck Typing
+ "If it looks like a duck, swims like a duck, and quacks like a duck, then it probably is a duck."
+ Ruby sends messages to objects without first checking what type they are

Note:
a car needs a driver to turn the steering wheel - that driver is usually a human, but could also be a dog or a robot

ruby sends messages to objects without first checking what type they are - that's what allows this as a strategy`

Chess pieces (including null piece) are an example of polymorphism; they all have the same methods.
---

### Inheritance

+ A relationship that defines a subclass from a parent class.

+ The child class acquires the properties and behaviors of the parent class.

+ Helps reuse code and keep your application DRY

+ Denoted with a `<`
	+ `class SubClass < SuperClass`

Note:
demo `1.class.superclass`, `1.class.ancestors`, &c.

Ruby (and javascript) are both "single-inheritance" languages

---

![inheritance-joke](http://scontent.cdninstagram.com/t51.2885-15/e35/13696803_678915018940809_1531785076_n.jpg?ig_cache_key=MTI5NTg0NTgwOTE2NTgzODMwNA%3D%3D.2)

---

### `super`

+ methods of the child-class override those of the parent-class
+ you can invoke the parent's overridden definition of a method using `super`.
  + `super` with arguments passes the given values into the super class' version of the method
  + `super` without arguments implicitly uses those passed into sub class' version of the method

---
### `Module::include`

This command adds a module's methods to a class as instance methods.

### `Module::extend`

This command adds a module's methods to a class as class methods.

---

### Modules Code Demo (Animals!)

---

## OOP Patterns

### the Null Object Pattern

A design pattern that uses an object with  neutral ("null") behavior.

### the Singleton Design Pattern

A design pattern that restricts the instantiation of a class to one object.

Note:
when are some times we might use these patterns?
NOP: empty squares, nonexistent users, &c.
SDP: databases, loggers, empty squares, &c.

---
## OOP Tips
+ decompose the system into parts
	+ the nouns in a problem are objects, the verbs are methods
+ Single Responsibility Principle
	+ a class does only one thing
+ changing one class shouldn't necessitate changing another
+ keep an eye on class size creep

---

### Exceptions

+ The means of telling the caller that your code can't do what was asked

**Syntax:**

`raise ErrorClass.new("message")`

```ruby
begin
	...
rescue
	...
 	retry
ensure
	...
end
```

---

### Exceptions Code Demo

---

## Chess Unified Modeling Language (UML)

[Chess Diagram](https://github.com/appacademy/curriculum/blob/master/ruby/assets/Chess_Diagram.png?raw=true)

---

## Quiz

[Quiz](https://github.com/appacademy/daily-quiz/blob/master/ruby/w2d1.md)

---

##  Today's Projects

- Error Handling Funtime
- Class inheritance
- Chess

---

# ty

---
