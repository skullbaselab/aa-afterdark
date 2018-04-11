# January 11, 2017
Lecturer: Dallas Hall
Scribe: Cynthia Ma
Topic: Javascript and Callbacks

## Lecture Questions
+ Is 0 equal to -0?
  + Yes.
+ If `==` isn't really used, why doesn't Javascript get rid of it?
  + There is a lot of legacy code out there that may rely on `==`
  + Inequality still requires one equal sign.
+ Is it convention to capitalize the first letter of the class or function in Javascript?
  + Yes. It won't break BUT you would confuse a lot of people.
+ In ruby, if you didn't return anything undefined. What does Javascript do?
  + function does not have explicit return value, javascript will return undefined.
  + You may return a null if you didn't want to return a false. However, you would have to explicitly `return null`
+ Effective Javascript is written in ES5, what is the value of this book?
  + A ton of interview questions come out of that book.
  + Still teaches core principles there that are used now. There is just a different syntax with the new versions of JS.
+ Do you need a semicolon after the definition of an object?
  + Yes and yes.
+ Ruby allows you to use the space ship operator to assign key value pairs in hash. Is there any other way in JS to assign key value pairs?
  + You can use dot or bracket notation as well.
+ What would you use a symbol for in Javascript?
+ Functions are objects? Whattt?
  + We allow them to be invoked and special methods (proto, constructor, prototype)
+ Is it possible reassign the `constructor` and `__proto__` of an object?
  + Yes, but don't! Different engines may call `__proto__` differently.
+ Do we ever do prototype assignments in the constructor?
  + Not typically. We assign constructor functions and then assign prototype methods.
+ Can I invoke a function without parenthesis?
  + Nope.
+ Hm, you didn't pass in the arguments. Is that alright?
  + default value for arguments is undefined if you do not provide an argument.
  + will not throw error on extra arguments.
+ Wanted to reassign a const. I missed up. Is there anyway to delete it?!
  + Just exit out of the environment and enter again.
+ Is const similar to ruby's CONSTANT?
+ Are strings primitive?
  + Yes. You cannot push characters into a string.
+ The index variable of a loop, if you dont declare a keyword var or let. What happens?
  + var: if you have this scoped to the global scope, it will become a global variable.
  + let: will create its own private iterative variable.

## Closures Chant Demo
+ Why are you not using semicolons in my terminal?
  + Sometimes there are automatic semicolon insertion
+ Can we clear the store?
  + store is scoped locally, we can't override that function. This is similar to Ruby's private methods.
+ Ruby garbage collects.  
  + Because there is a reference to the store inside of the return function, store would not be garbage collected.

## Quiz Q's and Open Forum
+ What is "340" - 100?
  + 240
+ What is "340" + 100?
  + '340100'
+ Single vs Double Quote, would it change your answer?
  + Nope. Use single quotes because of linter so you dont have to hold shift for double quotes.

## Immediate Action
+ All immediate actions was sent the Quiz Master: AJ.
+ Update quiz
+ Question 4) Should we change question for inner favorite food as a `const` instead of a `let` since the second time we use let we never reassign anyway.
+ Improve Grammar on Question. change 'is' to 'can'
  + `${dogName}` can `${trickVerb}`.
+ Question 6) Student view is different than the answer view.
  + student view: 'cb' and students see a while loop
  + instructor view: 'callback' and instructor does not have a while loop

## Feedback for Lecturer
+ Consistently referred to Ruby throughout the lecture.
  + Awesomeeee!!! This is something I would have wanted to see when I had this lecture 9 weeks ago :)!


# November 2, 2017
Lecturer: Dallas Hall
Scribe: Jesse Wong

### Q's
+ Does this have all the same performance benefits of using a hash in ruby as we do with POJO's?
  + yes, the same look up time
+ If I took out the "const Foo" could I still call the function
  + yes, the scoping would be slightly different, but yes.
+ what is the difference between a function and an object?
  + functions are objects, we can pass them as variables, change properties of them, define them on the spot, etc.
+ why is the "Foo" called on the const in one case and then as the function the next time?
  + I am defining the variable that points to the function, so it allows me to call it later by using this const variable name, it also means that if i change this const to something else, that is still how i will call the function
+ what is happening when you hover over your const "Foo"?
  + that is a feature that I have in VS code.
+ When you use prototype assignment what is going on?
  + every function has a prototype property, so when we assign something to the prototype we are saying that the key is the name of our function/property and the value is the function itself
+ when we say hashes in ruby are we talking about the same thing in js when we say object?
  + yes and no, everything in ruby is an object, strings, arrays, everything derives from object. In JS only POJO's are analogous to the ruby hash, but prototypal inheritance works much differently in JS, where if a method is called it will climb the inheritance chain until it finds the method or it will error.
+ In ruby it gives us an error if we don't pass in enough arguments what happens in JS?
  + JS doesn't care, it just does it's thing
+ in Ruby, when you alter a number, you are reassigning it, but with const in JS can you increment?
  + in JS you need let instead of const if you want to increment.
+ do you have to assign a bound function to a const or do you have to assign it?
  + If I wanted to just immediately call that, i could instead say :fido.bark.apply(jt);
+ is this apply and bind used to get similar functionality to subclasses in ruby?
  + yes and no, for right now yes, but as we get into async functions later on, we'll need this more than ever, but it will make far more sense tomorrow
+ could you say Celebrity.proptotype.speak = Dog.prototype.speak;?
  + yes
+ By reassigning "this" do things just keep getting added onto it?
  + this is never being stored anywhere,
+ is this similar to the binding we used in the rails lite project?
  + the ruby binding is far less specific than in JS
+ You can't say gogoGadget.tagLine = "the"?
  + nope, it will "let" you change/add the tagLine value on gogoGadget, but it doesn't change the const within the function
+ when we reassigned the tagLine as "the", does it then just get set on the const function?
  + yes
+ is the closure used more for functionality or to protect the tagline?
  + both, this will also make more sense when we get into currying later (either tomorrow or Monday)
+ could you technically use closures to define immutable constants?
  + technically yes
+ The only reason we can continue to access tagLine later on is because of this closure?
  + yes it doesn't get immediately garbage collected because there isa  reference to it later on in the function
+ in this forEach function, does JS know that the "num" is going to reference each number?
  + no, we are applying this nested function to the individual elements that forEach is providing as it iterates.
+ why does length not need the ()
  + .length is a property on the object prototype


# August 31, 2017

Lecturer: Dallas Hall
Scribe: Anastassia Bobokalonova

+ Does Number include Integers and Floats?
  + Yes.
+ Are those one type or separate types?
  + I think they're one type, Number, but could test it out in node and get back to you.
+ If you assign "this is a string" to a variable, what is that type?
  + It would be a string, not an object. String is a primitive type.
+ What's the difference between arrow methods and defining methods?
  + There's a lot of differences, we'll go over in the code demo.
+ If you declare a on the global scope and then redeclare it with let ..?
  + (Tests in node). Yep, it lets you, but we'll get to scoping in a second.
+ What if you have the function ageOneYear outside the cat object?
  + That's fine, since the one inside cat can only be called on the object.
+ Is it automatically putting the semicolons in node?
  + Yes.
+ Does it matter if we call it method style or in brackets? ie: `cat.age` vs `cat["age"]`?
  + They both return the same thing.
+ How do we get the methods on the class?
  + `breakfast.__proto__` returns the class Cat with a function ageOneYear.
+ Is this like class inheritance, multiple inheritance?
  + Yeah, we'll get to that tomorrow.
+ Do you need to put parameters into the functions you create? Seems like you don't. You can always assign a variable with just the dot notation after the fact, is that common?
  + No it's not common, better to have things defined on prototype and use the .new keyword.
+ There's no way to easily define a lot of functions on the constructor without the ES6 syntax?
  + That is correct.
+ Why would you ever pass a function to another function instead of just calling it?
  + I hope to answer that with the demo.
+ You talked about functions being first-class objects, how is that different from a procs/lambdas in ruby?
  + Will answer that tomorrow.
+ Is the fat arrow function just a syntactical difference in ES5 and ES6?
  + Yes and no. Fat arrow actually affects scope.
+ What is the 1 that is returned when you push into an array?
  + The default return values for your favorite methods aren't the same. In this case, it's returning the length.
+ In the return, you named the function chant, can we call it chant outside of createChant?
  + No, you cannot call this function outside.
    + So it's pretty common to leave it anonymous?
      + Yep. The only reason you might want to name it is if you assign it to chant, you can see its name.
+ Can you go over the difference between bind and call?
  + When I call .bind, it returns a function, and to invoke it, I have to add an extra set of parentheses. I could also save it to a variable. Whereas call will invoke it immediately.
+ Do we ever use this in real life?
  + Yes and all the time forever as a JS developer!
+ What do you mean by lexical scope?
  + I'll shoot out an article. But basically, anything you can refer to without getting an undefined error at any given point.
+ Is there something like 'use strict' that will give it a different number of arguments?
  + No, JS hates throwing errors, and you can pass a constructor the wrong number of arguments and that's fine.


# June 29, 2017

Lecturer: Luke Wassink
Scribe: Jules Costa

Q: Can curly braces wrap the body of a function on the same line?
A: Best practice is to put closing curly on a new line.

Q: How do you key into an object?
A: You can use brackets to key in via a variable, or . to key in with a actual key.

Q: Are floats and ints treated the same way?
A: Yes.

Q: Can you have more than one function in an object?
A: Yes, as many as you want.

Q: Syntax for defining a function in an object?
A: Various ways... 1. Start declaring the function and refer to it by name 2. Set function as a value for a key (name of the function)

Q: Are commas necessary in an object?
A: Yes, you need them to separate key value pairs.

Q: Why don't we need the function keyword?
A: You do, unless you're inside of an object.

Q: Where do prototypes come into play?
A: Prototypes are like Ruby classes. They tell you how to set up objects.

Q: Difference between const and let?
A: We'll talk about scoping in a minute, but they have the same effect.

Q: Are && and || lazily evaluated?
A: Yes, they are short-circuited.

Q: Are arrays ever equal with == ?
A: No.

Q: typeof "" ?
A: String.

Q: typeof back ticks ?
A: String.

Q: What does a fat arrow function look like?
A: (goes to whiteboard...can be declared anonymously, or be named)

Q: Difference between:
  function f() {}
  let f = function() {}
A: Nope

Q: Preferred approach?
A: In general, anything is fine. There are advantages to fat arrow, so you'll need to use it sometimes. I prefer to use it most of the time.

Q: NaN is always false?
A: Yes, it's one of 7 falsely values.

Q: Is there a difference between false and falsey?
A: Anything that evaluates to false is falsey.

Q: What is the prototype of a POJO?
A: Objects have __proto__ that point to object's prototype

Q: Can you explain __proto__ ?
A: You'll get more detail in a future lecture. It has to do with the way that JS gives objects behavior, and handles inheritance.
In JS, objects are created by constructor functions, and __proto__ points back to the constructor that created it.

Q: Prototype object vs POJOs?
A: Prototypes are functions. Objects are born from constructor functions. Objects have prototypes. Objects hold __proto__ as a reference to its prototype.

Q: Does Math.random always return a number between 0 and 1?
A: Yes.

Q: Can we concatenate numbers and strings?
A: Yes. It will coerce the number to a string. JS hates throwing errors.

Q: Prioritization of inheritance?
A: If the function is defined on the object, it will use it. If not, it will look to its prototype.

Q: Can you set default values on the prototype?
A: Better way to do it is to set default values on the constructor function. Use default arguments, same syntax as Ruby.

Q: How do we have access to a variable defined outside of a function?
A: Scoping! We have access to anything defined in the upper scope, because ... closures!

Q: Being a closure vs. having a closer?
A: A function is a closure, or a function closes over variables.

Q: Global and window are top-level objects?
A: Yes.

Q: Is window a function?
A: No. Window is an object.

Q: let vs. const?
A: const provides a guarantee that that variable will not be changed unintentionally.

Q: Can you close over variables that are multiple levels removed from you?
A: Yup!

Q: Do all functions have closures?
A: All functions will close over any variables available to them when they are declared, but you don't have to use any variables that you don't need.

Q: If we're okay with closures, why not var?
A: Var is about accessing something outside of where it's declared, closures go in the reverse direction.

Q: Why do you need to say this.property?
A: You must be explicit with this, unlike self in Ruby.

Q: This is available inside the prototype, and references an instance of the constructor?
A: Yes.

# w5d3

Lecturer: Jenn

## rails lite

+ _crickets_

## lecture

+ functions?
  + we'll get to that soon; functions are objects as well
+ -0 is falsey?
  + yes. not sure why you would do that, though.
+ benefit of type conversion in ==?
  + can be helpful
+ can you chop off additional arguments?
  + yes.
+ ??
  + i don't have to pass in a year; javascript functions are happy
  regardless of how many arguments they get
+ ??
  + no linter in node, so there isn't anything enforcing my semicolon
  usage. in general, things can break if you don't use semicolons
+ ??
  + "first-class object means" _couldn't hear_
  + wikipedia says a first-class thing is "an entity which supports all
  the operations generally available to other entities. These
  operations typically include being passed as an argument, returned
  from a function, modified, and assigned to a variable"
+ function-style vs. method style?
  + using an object's context or not
+ ??
  + variables defined at the top of the file will be available to all
  functions inside that file
+ why use let/const vs. var?
  + kind of complicated
+ const vs. let?
  + can't reassign variables declared with const
+ ??
  + yes - new scope, new const
+ ??
  + assign const x outside of a block and reassign it inside the block, ??
+ ??
  + if we don't define a new x and just reassign it, ??
+ ??
  + because it's block-scoped, that variable is only available inside
  that scope
+ so const y in the if block is a different y?
  + yes.
+ so is this a closure?
  + close - closure refers to functions closing over a variable
+ ??
  + block scope forces you to be more clear than function scope
+ ??
  + a function or blcok will look through all of the scopes available
  to it to find a variable that it uses
+ ??
  + yes, this x is the same x.
+ can you interpolate in js?
  + yes
+ ??
  + you do need backticks to interpolate in js, yes.
+ ??
  + yes, this function returns a function.
+ can i call cheer externally?
  + nope. you don't have access to it.
+ could i make a new function and called createChant in it?
  + yes. createChant is in scope.
+ is it typical to declare functions and assign them to const?
  + yes. function notation is also fine.
+ do you need the empty parens to declare an arrow function?
  + yes.
+ when are closures useful?
  + for returning functions from functions.
+ could you leave out anotherThing and replace it with "coffee"
  + yes.
+ is cheer allowed to take an argument?
  + yes: const cheer = (arg) => {  code }
+ function style vs. arrow style declaration?
  + creates the same function.
+ immediate invocation of a function return value?
  + possible, sometimes preferable.
+ if you added another argument?
  + nothing would change; that argument wouldn't be used.
+ if you didn't pass in any arguments?
  + the arguments' values would be undefined
+ can you call a function on a function?
  + yes; more common is calling a return value of a function
+ can you call createChant.cheer()?
  + no; it wasn't defined that way.
+ ??
  + rob gets assigned a color by running this function in rob's context
+ can you save bound functions?
  + yes.
+ can you assign things on the rob object?
  + yes: rob.hat = "baseball"
+ ??
  + context refers to the `this` inside that function
+ what arguments does bind take?
  + context, and then arguments for the function
+ what is bind doing?
  + returning a function with `this` changed.
+ what's happening with this setTimeout thing? why doesn't it wait for
the other piece of code to run?
  + the event loop will be explained in tomorrow's lecture
+ why use arrow function syntax?
  + because i like it!
+ ??
  + i prefer es6-style code
+ ??
  + setTimeout will wait for however long you tell it to wait

## hw

+ _crickets_

## quiz

+ ?? (Q1)
  + javascript is changing the type for us
+ ?? (Q3)
  + for clarity

## notes

+ no mic meant that you weren't super audible at the back of the room
+ always repeat the question
+ demos would be great for explaining undefined return values, falsey
values, === vs. ==, &c.
  + it can be hard for people to understand a new language just from
  reading it and hearing someone talk about it; it can be helpful to
  see someone's testing workflow
+ slides have a ton of content in them - cut them down?
+ less slide, more demo for explaining variable scoping as well
(defining a variable twice in the same scope, &c.)?
+ try to have demo code in terminal as high on the screen as possible
+ maybe bring up debugging code in chrome in the debugging section?
+ type conversion in js (i.e., ==) is nice because everything in HTML /
HTTP is strings
+ lots of very long, inaudible questions
+ holy smokes this is an 8-question quiz?


# 2/22/17

Lecturer: Jenn

## Rails Lite

* Does byebug use binding?
  * Look at the docs

## Lecture

* If primitive data types don't have methods, how do strings have `.length`?
  * Strings can be primitive or declared like objects
* Is `NaN` a primitive or an object?
  * Primitive
* Are symbols in Javascript the same as symbols in Ruby?
  * Probably yes
* Are keys in hashes symbols?
  * Probably yes
* Is -1 truthy?
  * Yes
* Why use `===`?
  * Type conversion
* (something about var, let, and const)
  * Don't use var
* (something about defining more functions)
  * We don't want to define functions on something's `__proto__`, we want to define it on the `prototype`
* (something about inheritance)
  * Yes, classes can inherit functions from other classes. We'll talk about it more on Friday
* (something about prototype)
  * A `prototype` is the set of functions defined on an object. Wait until Friday!
* What's `this`?
  * Reference to that particular object
* Is it like an instance variable?
  * Basically
* If we had a `forEach` loop and tried to call `this` would it work?
  * Depends on how you call the loop and how you set up the callback
* Can you pass in a hash of attributes instead of individual arguments?
  * Yes
* Can you create a new cat with just a name and no age?
  * Yes
* What if you created with 3 arguments?
  * Still works
* Can you call `arguments` and get all the arguments?
  * Yes
* What is `arguments`?
  * It collects all the arguments
* Are defining things on the prototype vs class like instance vs class methods?
  * Yes
* Is there something equivalent to blocks?
  * Anonymous functions
* What if we want to redefine something in an inner scope?
  * Use `let`
* Why shouldn't we use `var`?
  * Its scope is too big, you lose track of it
* Is Ruby block-scoped?
  * Yes
* Should we `use strict`?
  * A different mode, protects us from accidentally making global variables
* (something about inner scope)
  * Yes, it's a different variable because it's in an inner scope, even though the variables have the same names
* Is the outer function the closure?
  * No, the inner function is
* What's the deal with setting a function to a `const`?
  * We're saving an anonymous function to a variable and using an ES6-style arrow function. You can also declare it with the `function` keyword
* What's the benefit of fat arrow functions?
  * Useful for callbacks and closures because it doesn't create a new scope
* Is it a problem to name functions and constants the same name?
  * Yes
* (something about bind)
* What you call bind on is simply the function being accessed, what you pass into it is what `this` gets set to?
* If I didn't bind octavia, would it think that I'm referring to a robot??
* How do you use another class's methods on something else?
  * Use bind
* How often is bind used?
  * A lot, when we get to React
* Why don't we need parenthesis for callbacks?
  * callback argument must be a function, and not invoked
* Since setTimeout is a global function, can we call it without global in front of it?
  * Yes
* setTimeout doesn't look like other functions we've used. Why?
  * setTimeout is already defined for us.
* What's up with require? Where is `readline` coming from?
  * `readline` is defined somewhere else. We will talk about importing and exporting later. Don't worry about it now
  * Lets look at the docs
* Can you have more than one input for the answer?
  * Let's try it out... Yes!
* Could you include another answer in the final printout?
  * Yes
* Is this happening asynchronously?
  * Yes
* In ruby, we could do something in the command line and then do something with the answer. How can we do this in JS?
  * We need to tell JS what order to do things in. Use callbacks.
* If you wanted 10 questions with answers, do we need to nest 10 deep?
  * Yes. There are quicker ways, but yes.
* Could we see the answer after each question is asked?
  * Yes, we would just put a `console.log` before the next question
* What's the harm in using backticks all the time?
  * I don't know of any harm from using backticks
* What about escape characters?
  * You can use escape characters
* Can you put the question inside a function so you're not calling it several times?
  * You would still call it several times, but it would look nicer
  * We would still have the same issue of it not waiting for a response before asking again and prompting for an answer
* Does atom have a linter we can use?
  * Look for ESLint

## Homework
* Something about a bird? Elephants? Parade helper? Is this similar to passing in a block?
  * This is similar to passing in a block. Yes.
* When we use `forEach` do we have to tell it what we're passing in?
  * Usually we do. Our `paradeHelper` is a function that takes in an elephant

## Quiz
* Why does `34 + "0" = '340'`?
  * I don't have an explanation for this...
* How does `==` compare things?
  * Either changes everything into a string, or discounts the type? Use `===`, it's more predictable.
* Question about `break` and `continue` in `while` loops
  * `break` breaks out of the `while` loop
* If we wanted a function that changed what was logged based on the breed, where would we put that?
  * We would still put it in the prototype
* In the past, we prioritized time over space complexity. Wouldn't this take more time?
  * While it may take slightly longer, really, it's inevitable
* Is there a special naming term for a function that takes a callback?
  * Not that I'm aware of. But in the function signature, I would name it something callback related
* Last question: Wouldn't a closure always capture variables? aren't 1 & 2 redundant?
  * Yes
