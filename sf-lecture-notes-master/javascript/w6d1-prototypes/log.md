## January 15, 2018
Lecturer: Aaron Wayne
Scribe: Cynthia Ma

### Lecture Questions
+ All questions today was from the demos.

### Code Demo Questions
+ What happens to `this`?
  + Makes sure that this refers to itself.
+ Array.prototype contains all the methods in the Array class?
  + yes.
+ Anytime you use a constructor function, you create a new class?
  + Creating an instance of a class. Similar to an intialize function in Ruby.
+ What is the difference between .prototype vs __proto__?
  + .prototype is only for constructors. I'm a constructor function and these are my instance methods.
  + __proto__ is used for objects. Who is my parent?
+ What is the difference between classical and prototypical inheritance?
  + Prototypical inheritance. There are pairs of prototypes and constructor functions.
  + Will get back to student.
+ Why is it efficient to create a Surrogate class?
  + I'll send out some articles.
+ When isn't the constructor on the object itself. why not on the prototype?
  + It does. There is a reference to it.
+ Is there any efficiency differences between Surrogate vs Object.create?
  + Not that I know of.
+ Do you refactor surrogate to Object.create?
  + Depends on the company's code base.
+ What is the Shape.call(this) inside of the Rectangle Function.
  + It is similar to Ruby's super method. It will call the initialize function on the Rectangular class.
+ Can we leave the move function anonymous?
  + You can but its not best practice. You should always name your functiosn to assist other developers tracking your code.
+ Is it bad practice to use module.export a function?
  + Depends how you want to export. When we get to ES6 way, we will use something similar.
+ Can I export in ES5 and ES6 in the same project?
  + Webpack is also a trans-piler. It can translate JS code into older JS code.
+ Is there a performance cost using a transpiler?
  + This is only for development. Once we place files into the production, we'll have have bundle.js file.

### Quiz Q's and Open Forum

### Immediate Action

### Suggestions
+ Would it be possible to include the diagrams on the lecture notes?

### Feedback for Lecturer
+ Awesome diagraming.

### November 6, 2017

Lecturer: Stephen Pangburn
Scribe: Jesse Wong

### Lecture Questions

+ is color a variable or a property? (when defined on a function)
  + it is a variable, yes.
+ when would we want to define something on instance's prototype vs constructors prototype
  + instance doesn't have a prototype, only an __proto__ which points to the constructors prototype
+ when looking for a function, does it look in bailey or the Dog class?
  + It looks at the instance first, then the constructor and up and up until it reaches the end and then it will error out
+ __proto__? what does it point to?
  + it points to the prototype of the parent class
+ how does JS know, when you create a surrogate, to treat it like an abstract object
  + all surrogates are objects, so if you set some object to be treated as a surrogate JS will just use it as such regardless of the name of the object
+ Do you need to rename the surrogate every time you do this surrogate assignment?
  + you will call it surrogate pretty much every time, it is defined within the scope of the function, so naming conflicts shouldn't be an issue
+ does every object automatically have an __proto__?
  + yes, except for Object.
+ Dog.prototype.constructor = Dog; << what is happening here
  + this line allows us to create an instance of Dog instead animal when we call new Dog
+ why would it do that in the first place?
  + the new keyword, when it's called will automatically look to the constructor to create the instance, but the constructor would live inside of the protoype of the instance which until you set it otherwise is still Animal.
+ Will we need to know/use ES5 for interviews/everything
  + the tech industry is still adjusting and implementing es6, so knowing both is definitely advantageous. Opinions are still split on the benefits
+ Couldn't we just use a transpiler to go from es5-> es6 or vice versa
  + knowing how to write/understand/read both will be crucial to your job search and ultimate JS proficiency
+ Is constructor function stored in the prototype
  + it points to the prototype, but is a pro
+ webpack just concatenates those files?
  + it adds them together in order to eliminate any strange errors. it determines the order using those exports and import statements
+ every time you make a change, you have to webpack again?
  + yes, but there is an add on command called --watch and it will automatically update your webpack
+ is webpack the same as just writing everything in one big file?
  + yes


### September 4, 2017

Lecturer: David Dobrynin
Scribe: Kelly Chung

### Lecture Questions

1. Is call necessary on the `slice` of `arguments` object?
  + Yes, because slice is not directly defined on the arguments object
1. Would other `args`, be an array?
  + Yes
1. Can you call `Array#from` to create a duplicate of an array?
  + My hunch is yes - we'll find out.
1. Difference between `arguments` + rest operator?
  + `arguments` contains all arguments (specified or unspecified), whereas
  the rest operator will be an array that only contains unspecified arguments
1. Do you have an issue with scoping in the constructor function?
  + Not ordinarily.
1. Is the function style object construction equivalent to the ES6 `class`
syntax?
  + The ES6 syntax will encapsulate everything the original style does -
  but it does a bit more under the hood.
1. Can you set the attributes of a particular instance of a class
using `setPrototypeOf`?
  + Perhaps, but definitely not the way to go
1. How many properties can an object contain?
  + No idea - not a relevant maximum
1. Basically - what's the point of these prototypes?
  + to store instance methods primarily, although there are probably
  many other use cases (like inheritance)
1. What about `extends` for classes?
  + That's the new new way! ES6 is very Ruby-esque
1. Is there anything else to know about the `Object.create` method of
prototypal inheritance?
  + Nothing for your memory - it's essentially just a shortcut
1. Why do we set Dog.prototype to an instance of the Surrogate class?
  + We don't want all the prototypes to refer to the same object.
1. Does Webpack minify?
  + It can
1. Can we monkey patch on the fly - like we do in Ruby
  + You can monkey patch the prototype - just not the actual constructor
1. Is it common to export multiple constructors from the same file?
  + Incredibly common - very common in React
1. How does Webpack know what files are changing?
  + My best guess: registry of all the files that should be watched
1. In Ruby, you have modules you could use to share methods between objects
  + You can just take them using call or you could inherit from the same
    object. Not an exact analog

# 6/30/07
Lecturer: Shamayel

Note-takers: Jules and Elliot

## Questions from yesterday:

#### Q: myBind - Isn't using apply inside of myBind circular?
A: They do do the same thing, but this is to show you the inner workings of bind.

#### Q: What's the difference between apply and call?
A: Apply takes an array of arguments, call takes individual ones.

#### Q: In what context would you use apply vs call?
A: Depends on how you want to pass your arguments in (what they already look like)

#### Q: Bind args vs call args?
A: We can take a set of args when we set up bind (passed along with the context), because when we attach bind to something, it doesn't invoke the function. Call args can be involved when you are invoking bind. Alternatively, use arrow functions, because they bind the context automatically.

#### Q: Is it possible for the callback passed to setInterval to execute before setInterval?
A: Yes, if it is invoked.

#### Q: Whenever we use a =>, can we think of it as a bind?
A: Essentially, yeah.

#### Q: Can we use ... (rest) operator instead of arguments?
A: Yeah,

```(javascript)
function someArgs(one, two, ...three) {
  console.log(one)
  console.log(two)
  console.log(three)
  console.log(arguments)
}

someArgs(1, 2, 3, 4, 5, 6, 7)
=>
  1
  2
  [3, 4, 5, 6, 7]
  [1, 2, 3, 4, 5, 6, 7]

someArgs(1)
=>
  1
  undefined
  []
  [1]
```

#### Q: What's the process of checking if a variable is undefined?
A: ```undefined``` is a falsey value, can throw in an if statement OR undefined === undefined => true

#### Q: Does the rest operator have to be last argument in function?
A: Yes

```(javascript)
someArgs(1, 2, [3, 4, 5])
=>
  1
  2
  Array[3]
```

#### Q: What's going with 0: 3, 1: 4, 2: 5?
A: Index of elements array

#### Q: Is the rest operator reversible?
A: Yes, you can capture list of args into an array, and split an array into its elements.

#### Q: Can you use rest operator outside of a function (like ...[1, 2, 3])?
A: No, doesn't work

## Prototypes

#### Q: What was the reason for not setting ```Snake.prototype.__proto__``` to ```Animal.prototype```?
A: It's very inefficient. It used to be disallowed until recently.

#### Q: ```Object.create``` vs ```Object.assign```?
A: ```Object.create``` returns an object that has a proto that references whatever was passed as argument. This is used for prototypal inheritance.

```Object.assign``` is like dup; makes a copy of the object passed as an argument.

#### Q: ```extends```?
A: ES6 syntax (```class Snake extends Animal```). Does prototypal inheritance behind the scenes

## Surrogate

#### Q: Are instances more like functions or more like objects?
A: They're more like objects (functions are objects too).

#### Q: Why does it work when we assign child.prototype to be new Surrogate() ?
A: We point to an instance that points to parent's prototype

#### Q: Order of this important?
A: Yes; just like with Object.create, we need to set up prototypal inheritance chain before adding methods to the child class (otherwise, all child methods will be lost after child.prototype = new Surrogate() ).

#### Q: Is it better to do this early on?
A: Yes it should be the very first thing you do after the constructor.

#### Q: Can you explain child.prototype.constructor = child ?
A: We have a prototype for our child, but it was born from Surrogate (it's an instance of Surrogate). We need to set this up to say that constructor of the prototype is child and not Surrogate. So it's basically reassigning the constructor from Surrogate (when we made an instance of Surrogate) to the child (like Snake) so when we make instances, they are Snakes, not Surrogates.

#### Q: Is there way to set up inheritance so that it inherits some of the parent?
A: No, it's all or nothing; but can override parent methods.

#### Q: How do we use super in javascript?
A: Very similar to Ruby. In ES6 in constructor, simply call super()

#### Q: Prototype vs __proto__?
A: Classes have prototype, which have a __proto__ to go up chain. Instances have __proto__, which point to it's class' prototype, which have a __proto__ which point to it's parent's prototype, etc...

#### Q: Constructor?
A: Constructor is part of creation process. Variables on instance get stored within the instance.

#### Q: When you call super, do you need to pass it this?
A: In ES6, no (class syntax handles this for you). In ES5, if function style, the way to super variables is with Parent.call(this.name).

#### Q: Once we start going up the chain, we follow the __proto__?
A: Yes, __proto__ goes up the chain, prototype looks at current place.

#### Q: Can we look down the chain?
A: Not really.

## Webpack

#### Q: What's the deal with webpack --watch (or webpack -w)?
A: It runs webpack and updates bundle.js anytime a js file is changed.

## Quiz

#### Q: What's a transpiler?
A: Takes a language and translates it into another language.

---

# 9/14/2016
Lecturer: Ryan Hall

### Questions
  * Can we call `this` on a callback?
  * Do fat arrow functions have context? How does scoping work?
  * If you put fat arrow function in variable, does it keep scope in which it was defined?  
  * It __proto__ deprecated?
  * Why can't I set prototype of a class equal to another class's prototype?
  * In the video we saw constructor function used with super call. Can we use super while writing the inherits function?
  * Does the sequence of files in `entry.js` matter?


## 6/13/2016


Lecturer: Jeffrey Fiddler

### Questions

* Lots of CSS reading vs. CSS doing - how to balance?
* Node version - safe to assume that everything that runs in newer version of node will work on  
  assessment?
* Will canvas be on assessment? Is canvas important?
* Why do we set the surrogate prototype to parent prototype?
* Proto vs. prototype?
* Do objects have prototypes?
* Why can inheritance go up the chain and not down the chain?
* Why not make an instance of animal instead?
* How is the prototype created without ever initializing an animal?
  Where does the prototype comes from? (Every time we declare a function, we get a prototype)
* Why not just reassign __proto__ to animal.prototype?
* When you reassign prototype do you lose all of your previous methods?
* What about the constructor property?
* Still make sense to do surrogate inheritance when we do parent.call inside constructor function?
* How does request animation frame work?
* How does request animation frame not cause stack overflow?
* How does the event loop work?
* Why request animation frame instead of setTimeout or setInterval?

### Mistakes


### Notes
* nobody asked about material from last week, all prototype stuff
* didn't answer any questions about canvas, told them memorizing the API wasn't
  that important
