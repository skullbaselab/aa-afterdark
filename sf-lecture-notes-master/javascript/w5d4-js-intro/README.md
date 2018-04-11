# W5D4 - JavaScript!

---

## Agenda

* Lecture
* Questions about the homework
* Questions about the quiz

---

## Lecture

---

# Javascript!

---

## Some things to look forwards to
* [Chill the Lion](https://codepen.io/Yakudoo/full/YXxmYR)
* [Tearable Cloth V2](https://codepen.io/dissimulate/pen/eZxEBO)
* [Solar System](https://codepen.io/juliangarnier/full/idhuG/)
* [Retro 3D](https://codepen.io/dallashall/full/RxZvZK/)

---

## Learning Goals

* Be able to answer the following questions:
  + have I declared variables properly?
  + do I have access to variables in a particular scope?
  + what does `this` reference?
  + do I have semicolons in the right places?
  + am I invoking this function correctly? do I need to be invoking it?

---

## Overview

+ data types
+ style and syntax
+ objects
+ functions
+ closures and scope
+ callbacks

---

## JS Data Types

* Primitives
  + Boolean
  + Null
  + Undefined
  + Number
  + String
  + Symbol (new in ES6)
* Objects

---

## JS has 7 falsey values: 
  
  `undefined`, `null`, `NaN`, 0, -0,  "", false
  
### Use `===` and `!==`
  + Avoids tricky and unreliable type conversion with `==`
  
---

## `instanceof` versus `typeof`

  ```js
  function Cat() {}
  const kitten = new Cat();

  cat instanceof Cat // => true
  typeof kitten // => 'object'

  typeof "this is a string" // => 'string'
  ```

---

## Style and Syntax

---

# You must use **explicit returns**
(unless single-line fat-arrow functions)

---

Returns 5:

```js
const sum = () => 3 + 2;
sum(); // 5
```

---

Returns `undefined`:

```js
const sum = () => {
  3 + 5;
};
sum(); // undefined
```
---

+ You must use parentheses for if, loops, and function calls and declarations
+ Declare all variables, or risk accidental globals
+ Use camelCase variable names

---


+ End all expressions with semi-colons
(Mainly assignments and function calls)

---

## Objects

* can be used like a ruby hash
* are called **Plain Old Javascript Objects** or **POJOs**
* can have functions as values (called methods)
* can access object attributes with `[]` or `.` notations
  * can only use `.` if attribute name begins with alphanumeric character, `$`, or `_`

---

## Objects

```js
const cat = {
  name: "Tiger",
  meow() {
    console.log("Mrwar!");
  },
  posterPhrase: function () {
    console.log("Hang in there.");
  },
};
```

---

## Constructor functions (review)

* we use constructor functions to create new objects
* when the constructor is called with `new` keyword, `this` is set to a blank object
and the `__proto__` property is assigned to constructor's prototype
* instance methods are added to the prototype of an object
* equivalent of Ruby class methods are called static methods

---

If a method is not present on an object, it will look at the `__proto__`.

If a method is not on the `__proto__` (constructor's prototype), it will look at the constructor's `__proto__`.

---

## Make a constructor function ( <ES5 )

```javascript
const Foo = function Foo(a, b) {
  this.aProperty = a;
  this.bProperty = b;
}
```

---

## Create an instance of Foo

```javascript
const bar = new Foo("apple", "bannana");
```

---

## the `new` keyword...

`this` = 
```javascript
{ 
  constructor: Foo,
  __proto__: Foo.prototype,
  aProperty: "apple",
  bProperty: "bannana"
}
```

---

## Add instance methods:

```javascript
Foo.prototype.coolFunc = function coolFunc() {
  console.log(this.aProperty);
};
```

---

```javascript
bar.coolFunc(); // Logs: apple
```

---

## Functions

* functions are first class objects
  - can be passed to a function as an argument
  - can be returned by a another function
  - stored in a variable
  - stored in a data structure
* common to pass functions to other functions
* can use anonymous functions as arguments, **like blocks in Ruby (but BETTER)!**
* parentheses are ***required*** to invoke functions

---

## Ways to invoke a function

* function-style
  ```js
  functionName(arg1);
  ```
* method-style
  ```js
  objectName.functionName();
  ```
* constructor-style
  ```js
  new ConstructorName(arg1, arg2);
  ```

---

## Variables and Scope

* 3 main ways to declare variables in JavaScript (`let`, `const`, `var`)
* `let` and `const` (ES6+) are block scoped
* **prefer `const`, unless you have to use `let`**
* `var` is function scoped. **Don't use it!**

---

## What is wrong with this?

```javascript
a = 5;
```

---

# Do not create global variables!

---

## Scope: What variables are accessible in a given place in code?
+ arguments
+ local variables
+ variables declared in an outer scope when the function was first defined

---

## `this`

* like Ruby's `self`
* not implicit
* value of `this` referred to as the function's **Context**, and sometimes as the **Receiver**
* if a function is invoked on an instance object, `this` is set as that instance
* `this` can be tricky! luckily we have `bind` (more on this tomorrow).

---

### Global Scope

* Avoid making global variables
* Watch out for accidental globals
* Global variables become properties of global object
* `window` or `global` (unless using strict)

---

## Closures (with Chant Demo)

A function which accesses variables that were neither passed in nor defined inside that function.

* free variables: variables neither declared in, nor passed as arguments to a
  function
* a closure is a function that captures free variables and "closes" over
  them
* used to create private state
* Are formed when a function is *defined*, not when it is invoked

---

### Callbacks (with forEach Demo)

* function that is passed to another function (think about blocks!)
* can be as simple as passing a function to `forEach`
* can also be used with `setTimeout` method or `readline` library
  + `setTimeout` runs a callback after a certain period of time
  + `readline` gets user input and passes it to a callback
* we'll use callbacks for timers, to retrieve data from the server, events

---

## Debugging

* Be able to answer the following questions when debugging:
  + Have I declared variables properly?
  + Do I have access to variables in a particular scope?
  + **What does `this` reference?**
  + Am I returning values?
  + Do I have semicolons in the right places?
  + Am I invoking this function correctly? Do I need to be invoking it?

---

### Questions about the quiz

https://github.com/appacademy/daily-quiz/blob/master/js/w5d4.md

---

### Questions about the homework

https://github.com/appacademy/curriculum/tree/master/javascript/homeworks/intro_js_problems

--- 

# DONE!
