# JavaScript Day 2
Students are still very new to JavaScript. They are running into the typical bugs:
* Forgetting to invoke functions
* Invoking callbacks when they are passed in as arguments
* Creating global variables
* Not understanding context/scope

## Topics Covered in Readings/Materials
The JavaScript readings are dense, and for students who are new to JavaScript (or programming in general), some of it will not have sunk in yet. A well-prepared student has been exposed to the following topics:
* Arguments
  * `arguments` object
  * default values
* `call` and `apply`
* Callbacks, and asynchronous JS (Node's I/O)
* The event loop
* ES6 Class syntax
* ES5 Node Modules
* Chrome Dev Tools
* Linters

Students are also asked to read specific sections in Effective JavaScript. Unfortunately, these readings are sometimes neglected (but are critical to wholesome understanding of JavaScript). The model student has read about:
* Closures
* Hoisting
* Event Queue, I/O, and non-blocking code
* Event Queue, workers, and `setTimeOut`

From the homework:
* `setTimeout` and callbacks
* `setTimeout` with closures
* `readline` and asynchronous code
* `call` and `apply` with Markov and Noodles

## Topics Covered in Today's Projects
* callbacks (absurdBubbleSort!)
* asynchronous I/O (hanoi)
* Tic Tac Toe

## Preparing to Lecture
You will want a tight grasp on:
* [The differences between Ruby, ES5, and ES6](https://appacademy.github.io/curriculum/language_comparison/index.html)
* `this`, `call`, and `apply` [here](https://dallashall.tech/index.php/2017/05/03/more-javascript-object-references-and-this/) and [here](https://dallashall.tech/index.php/2017/05/02/javascript-this/)
* [The `arguments` object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/arguments)
* [ES6 classes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
* Callbacks
* [The Event Loop](https://blog.carbonfive.com/2013/10/27/the-javascript-event-loop-explained/)

## Lecture Notes
With any lecture, you will want a written outline of what you will be covering, your slide topics, and any code demos you will be covering (just in case you make a typo or get side-tracked). Below is an example outline you might use for this lecture:

# JavaScript Day 2
* Agenda
* Learning Priorities
* Ruby/ES5/ES6 Comparison (review)
  *  Mention destructuring, but don't demo yet.
* `call` and `apply`
  * Demo
* `arguments` object
  * Demo? (They do this in their HW)
* Class Syntax
  * Demo (Keep short. No questions until it is finished.)
* Module Pattern
  * Demo object destructuring and shorthand.
* Callbacks
  * Demo? (May be better to combine with Event Loop?)
* Event Loop
  * `setTimeout(cb, 0)` demo
  * Students typically struggle with this
* Quiz Review
* HW Review
* Questions
