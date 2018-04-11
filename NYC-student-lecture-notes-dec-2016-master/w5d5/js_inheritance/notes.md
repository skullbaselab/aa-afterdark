## Solutions

## Prototypal Inheritance

* Motivation
* What we have so far
* Hack it until it works
* ES6 Syntax

*   function Surrogate() {}
*   Surrogate.prototype = ParentClass.prototype
*   ChildClass.prototype = new Surrogate()
*   ChildClass.prototype.constructor = ChildClass

## Currying
* In mathematics and computer science, currying is the technique of translating the evaluation of a function that takes multiple arguments (or a tuple of arguments) into evaluating a sequence of functions, each with a single argument

## JS In browser
* Previously just downloaded static HTML documents written by rails
* Now we will have HTML document tell browser to request JS files too
* No require in browser
* When these files download they execute in the order requested
* Have to be careful to not reference objects that haven't been defined yet

## Webpack
* Requiring in the browser!
* Creates a bundle file.
* Starts at entry and runs it at the top level ?
* Every 'required' file is run ONCE, it's return value saved for later (module.exports ||= file.eval())
* every file is a function scope.

## Canvas
* Context is API for change what is on the canvas element
* Need a reference to your canvas element
* get context, use context to draw/clear etc
* https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API

## Quiz
