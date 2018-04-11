# January 12, 2018

Lecturer: Kelly Chung
Scribe: Cynthia Ma

## Lecture Questions
+ What is hoisting?!
  + Hoisting is moving declarations to the top.
+ Is object deconstruction a way to multiple assigning variables?
  + Yes and yes.
+ Javascript is adopting a lot of Ruby syntax. Is that why Ruby is less relevant?
  + Let's look at the stackoverflow data survey.
  + Ruby was very popularized because of rails, convention over configuration
  + However people want more flexibility.
  + Also JS is moving to frontend and backend.

## Code Demo Questions
### .call Demo
+ Do we have to bind because this is not defined in the method?
  + Yessss.
+ If we wrote this ruby, what do we have to do?
  + Ruby has binding. There is no such thing is calling an unbound function.
+ Why are we passing these arguments this way?
  + This is a contrived example to illustrate the effects of .bind.
+ What is the difference between invoking the function vs .call
  + The main difference is that you can change the context of the function. context = whatever `this` refers to
  + This is similar to .send in ruby.
+ Can I bind a function into another function?
  + yes.
### .arguments demo
+ Is arguments array-like?
  + It is an array.
### prototype demo
+ Is ruby considered un-efficient since we declare instance methods on the class and not on the prototype?
  + Ruby doesn't handle classes the same thing
  + Prototypical inheritance is unique to Javascript
+ Are functions in Ruby objects?
  + The closest to thing 'objectiving' functions is called procs and Lambda.
+ If you don't have an initialize function,
  + Try not to compare Ruby to this too deeply.
+ Are ProtoHuman.proto similar to instance methods?
  + Yes.
### event time out demo
+ If you are Facebook, and you scroll down and wait for new posts to load. Is that similar to what we see in the event loop?
  + Yes. The infinite scroll effect is an example of the event loop.

## Quiz Q's and Open Forum
+ n/a

## Immediate Action
+ In the class.js demo, change 'classThomas' to 'Thomas' because the name classThomas implies even though it is a instance of classHuman, it is its own class which is not true.

## Suggestions
+ Potentially create a hoisting reading or exercise
+ Is there var vs const vs let reading?
+ The topics of today are REALLY random as a learner. How can we best tie this topics together so its more cohesive between the event loop and different syntax between ruby vs js and bind/apply.

## Feedback for Lecturer
+ It was difficult to start lecture about .bind so early at the beginning of lecture. I don't think students saw the REASON of why we did it as opposed to that this is a possible way to execute this. What is the power of bind? Instead of saying its a contrived example, go through the reasons why a coder would choose to bind. Maybe we should't go through bind until we go over event handlers.


# October 3, 2017

Lecturer: Dallas Hall
Scribe: Jesse Wong

+ the arguments has a "length" property? is that right you can call that on them?
  + you can call length on arguments.
+ why can we call length on arguments, but not on an array
  + it is an array-like object, but not exactly an array. JS just decided that it should be allowed to have that method on it.
+ it knows to access the arguments using the spread operator function
  + syntactic sugar!
+ aside from legacy web apps is there a reason to stick with es5?
  + while there are some small differences, the short answer is no. interviewers and companies will likely ask about both, but for your programs, es6 is best moving forward
+ in the class constructor, we don't need to use let or const to define the functions?
  + that is correct!
+ class methods?
  + yes, just say static in front of the method.
+ In ruby we had attr methods do we have an equivalent in js?
  + everything is read/writable in js so we don't even need them
+ in the docs if it has brackets around it, they are optional?
  + yes
+ do both call and apply do .bind under the hood?
  + apply is actually what is being called under the hood, using [[apply]] js uses a "this" and arguments to keep them both together until they're called
+ can you also define certain const's on objects in general
  + yes, a constructor function inherits form object so you can
+ ClassHuman.prototype.yell is as if we had just defined yell() on the class to begin with?
  + yes
+ classHuman.classVar = ["option"], what is happening here?
  + this is defining a class variable
+ in an export function is the key the object or is the value the object?
  + the key is the name, and the value is the object
+ does the order matter in your export/import statements?
  + no
+ how come if the call stack is a stack things(async function evaluations) end up on the bottom?
  + we wait before the stack is completely empty, and then we add it into the stack so it comes after everything else(aka the bottom)


# September 1, 2017

Lecturer: Dallas Hall
Scribe: Anastassia Bobokalonova

+ We're not actually creating an array when we multiple-assign right?
  + Yes, it does return an array but we don't save it.
+ Would x and y be both constants?
  + Yes, two individual constants.
+ Can we use let instead of const when multiple assigning?
  + Yes.
+ Can we use this method for bubble sort?
  + Haha, yes. We have a demo.
+ Does object destructuring store x as a value or as an object..?
  + It will store x, which if you call, will return 1.
+ Why are we putting constants into hashes?
  + It's useful to pass around options objects, options hashes, so we're making it easier to assign variables.
+ When we're writing in JS, do we prefer ES6 syntax?
  + The answer is yes, with one exception of arrow functions. It's better to use them as intended instead of replacing function definitions everywhere.
+ In ES6, the spread operator takes which arguments?
  + It takes the remaining arguments which weren't explicitly passed.
+ These are called instance variables in JS too?
  + Yes
+ How new is this ES6?
  + 2015. It's getting adopted to the market. ES8 was just released.
+ The constructor function..?
  + It's like ruby's initialize function, where we set our instance variables.
+ When exporting, do we need to capitalize?
  + No, but I'll go over it in the demo. It's capitalized here because its a constructor.
+ Does ruby export under the hood?
  + It's copy and pasting into the file it works with, but in JS its a lot more exact.
+ Which syntax will be on the assessment?
  + You'll be using ES5 and ES6. When it comes to require and export, know these, but we're not testing that on the assessment.
+ If we start writing our file in ES5, then want to switch to ES6, will that work?
  + Yes, both are valid JS.
+ When you have brackets in the documentation, does it mean it's optional?
  + Yes.
+ When you hovered over dog, you saw all the attributes, how did you do that?
  + That is a feature for VS Code. There are probably packages for it in atom.
+ Is there any use to using bind vs call and apply?
  + Yes, call and apply invoke right away. Where as bind can take callbacks.
+ Is there a way to pass in the third argument without the first and second?
  + Yes and no. There's not an easy way, you can do `null/undefined, null/undefined, third`.
+ Doesn't slice take numbers so you know where you're slicing?
  + Yes, it's optional. If you don't provide a number, it makes a shallow copy of an array.
    + Is that the same as slice[0]?
      + You're welcome to experiment with this.
+ If you wrote `ClassHuman.prototype.something` would that work?
  + Let's try it out. Yep, we are just doing syntactic sugar for how we defined things before.
+ In Ruby you can use class variables to keep track of how many instances you make, can we in JS?
  + In JS, you can use static methods to keep track of how many classHumans we make.
+ In Rails, we can do Class.all, in JS?
  + Yes and no. Mostly no for right now. .all is a function given by ActiveRecord. There is an ORM which gives you similar functionality but that's out of scope.
+ Slack out => Defining class variables. `ClassHuman.someConstant = ["option"]`.
+ Exporting and capitalization?
  + Exporting a constructor/class w caps. But we can make an instance and export that if we'd like.
+ Why do people like to create functions from within the arguments list?
  + It's not as readable, but some people prefer to not have intermediate variables.
+ What do you mean by breakpoint?
  + It means I am going to pause before I execute the code.
+ How to debug?
  + It's probably easier to make a blank html file, require the JS scripts and debug in chrome dev tools.
+ It asked `What is your name?` twice...
  + I was playing with debugger before this demo, it should only ask it once.
+ Where did we define `fnAsynch`?
  + This gets passed in, in this case its `addTwoNumbersAndIncrementAsynch`. This is tricky because an argument is no longer a static variable, but a function that can be called. So I recommend putting a debugger and opening it in chrome developer tools.
+ Even though we defined `const fnAge = cat.ageOneYear`, when we call it fnAge(),  `this` is not cat?
  + Yes, it was called on the window.

# June 29, 2017

Lecturer: Dallas Hall
Scribe: Kelly Chung

### Lecture Questions

1. Can you use double quotes?
  + Can't use double quotes and expect interpolation to happen.
1. Is there a way to get atom to automatically interpolate?
  + I'm not sure what it is in Atom, since I use VS Code
1. In the multivariable assignment, does const [x, y] make the array
const or the variables const?
  + X and Y are considered constants
1. Let or const?
  + Either where appropriate
1. If I change the value of x after executing `const obj = { x, y }`,
do the internal values of the object change?
  + No
1. `console.log` === `puts`?
  + Pretty much
1. Can you give an arrow function a name?
  + You will usually set it equal to a variable
1. `||=` in JS?
  + No direct equivalent syntactic sugar, but the underlying operation
  still exists and behaves in the same way
1. Why do you need both apply and call?
  + Different situations will call for either. You don't want to have to
  create an array for the arguments every time if we just had apply and
  vice versa
1. If you pass in more arguments than explicitly called for, do those
get captured by the `arguments` object?
  + Yes, absolutely.
1. Is there a cool way to protect yourself from too little or many
arguments?
  + Nothing automatic - it's all manual
1. Does rest operator have to be the last argument?
  + Yes
1. Is JS open source?
  + *Slacks out link after lecture*
1. Do we have access to the prototype inside the constructor function?
  + Not sure, but it is not advised.
1. Can we wrap this entire thing in class? (in reference to ES5 class
  definition)
  + Absolutely.
1. `let` vs `var` - can you clarify what you mean by block scoped?
  + *refers to code demo*


# 4/27/2017

- Lecturer: Gage
- Scribe: Luke

## CSS Questions

* What if you have multiple style sheets?
  * Separate links for each, or minify into one file.
* Descendants vs direct descendants?
  * `li > a` vs `li a`
* Loading external files?
  * Anything with a source tag - after HTML is rendered.
* How does javascript sort strings?
* `undefined === undefined`? What about `""`?
  * Try it out.
* So it's about comparing different instances?
  * Yes.
* What if we use `+` instead of `-` to sort?
  * I'm not sure - probably wouldn't sort at all.
* `[] == []`?
  * No
* Javascript division?
  * Turns Integers into Doubles.
* Function style keep scope?
  * No.
* Does bind mutate, or does it just return a bound function?
  * Just return.
* Spread operator?
  * Like ruby splat?
* Why `call` and `apply`?
  * We didn't use to have the spread operator.
* Rest parameters vs. Arguments?
  * Depends on fat arrow vs. `function()`.
* Functional difference between class based and prototypal inheritance?
  * Not really.
* Why don't they change weird stuff in js?
  * Backwards compatibility.
* Should we mess with `__proto__`?
  * We'll talk about that tomorrow.
* Parentheses around args to fat arrow?
  * Not needed if only one arg.
* Do anonymous functions make things complicated?
  * Not as much as you might think.
* Overlapping callbacks????
  * Something???
* Does `setTimeout(_, 0)` really mean `setTimeout(_, 0.0001)`?
  * Say again.
    * ???
      * Do you mean: what order do things run in with a `setTimeout(_, 0)`.
        * Yes
          * Wait till callback queue is empty.
* What manages threads and callbacks and such?
  * JS runtime environment.
* How do other languages handle asynchronous behaviour.
  * Mailboxes is an alternative.
* So SetTimeout(0) stuff runs after everything else?
  * Yes!
* Blocking the stack for a long time?
  * Probably won't happen.
* ??? It's kind of hard for the scribe to hear you without the mike.

# W5D4

## 12/15/2015

Lecturer: Gage Newman

### Lecture Questions

#### Arguments

+ When you define a function, do the arguments default to undefined?
+ Does parallel assignment work in JavaScript?
+ What if we call `...` on a 2-dimensional array?

#### bind, call, apply

+ When would you want to use `bind` vs. `call` vs. `apply`?
+ Can you use `bind` to give an instance of a class a method?
+ Class instance variables??? (Much confusion)

#### Class Syntax/Modules/Callbacks

+ What is the preferred class syntax?
+ When you're exporting multiple objects, where do we use the keys/values?
+ Is there a preferred way of writing callback functions? Which way will you see most often?
+ Is there any reason to use backticks, `""`, or `''`?
+ Lots of confusion about defining functions:
  * What is `this`?
  * When is the value implicitly returned?
  * When do you need curly braces with fat arrow functions?

#### Event Loop

+ Why does the callback to go to the WebAPI call stack before the callback queue?
+ What happens when you use setTimeout with 0?
  * When would you use this?
Add Comment Collapse

## 10/13/2016

Lecturer: Claire Rogers

### Questions
#### From yesterday's projects
+ Function with a callback inside of it and you want to return out of outer function from the callback - is there a way to do that?
+ How do we deep dup an array and push onto it in one command?

#### From the Homework
+ `ul a {}`, `ul { a {} }` and `ul li a {}` differences
  - you can't nest selectors in CSS only sass

#### From lecture
+ Is there a way to make `dogWalkers(arg1, arg2, arg3)` work using `bind(dog)`?
+ Why doesn't bind work here? Because `this` is defaulted to `window`
+ Why would we do it this way other than to demonstrate using `apply` and `call`?
+ Why don't we have to use the rest operator for `apply`. Note that it does throw an error.
+ Is prototype inheritance in Javascript any different than class inheritance in Ruby?
+ Say we have `let = Human` could be just define a function on it?
+ Can we do something like `NBA.prototype.dunk()`?
+ Can we open up classes and monkey-patch like we do in Ruby with ES6?
+ What is the return value of `setTimeout`?
+ If you have two asynchronous functions like `setTimeout` with `100` and `200` what gets run first?
+ How does the array function change the definition of `this`?
+ Questions about `map` with fat arrow being like pipes in Ruby?
+ Style for fat arrow functions?
+ When do we use `()` or `{}` in fat arrow functions?
+ `setTimeout` with a time of zero - why would we do this?
+ When do listeners terminate? When is our code done?
+ Are buttons in html following a similar process as a click listeners?


### Mistakes
+ Students were very confused about how POJOs work in JS.  Didn't know how to index, if was like a Ruby hash, etc.
+ General confusion over what is ES5/ES6 syntax.  People mixing them up or using both at once.
+ Questions on order of asynchronous functions - wanting to test for their own understanding.
+ Q4 on the quiz was missing import/export - I believe this has already been fixed


### Notes
* **This lecture used to be w5d5**.  This was the first cohort that JS started on w5d3.  Content of lecture has changed slightly.  
* I did a bunch of small demos for this lecture.
* Using `Array.from` will return all the passed in arguments and the context in which the function was defined.  
