# W5D4

YavaSkripten

---

# Content

* History Lesson! :)
* Ecmascript

---

## Style and Syntax

* You must use **explicit returns**
* You must use parentheses in if, loop, and function calls and declarations
* Declare all variables with `var`, or risk accidental globals
* Use camelCase variable names
* JS has several falsey values: `undefined`, `null`, `NaN`, 0, "", false
* Use `===` and `!==`
  * Avoids tricky and unreliable type conversion
* End all lines with semi-colons
  * Don't rely on *Automatic Semi-colon Insertion*

---
## JS Types
  * Strings
  * Numbers
  * Booleans
  * Objects
  * null
  * undefined

---

## Important Object types
  * Object
  * Function
  * Array
  * String
  * Number
  * Date
---

## Gotchas

* `Array#concat` creates a new array
* `NaN`
* `for...in`
  * `hasOwnProperty`

---

## Server-side JavaScript

* show aproaches to testing js (node, chrome)
  * HTML page
  * `console.log`

---

## OOP JavaScript
* functions are first class objects, like other values
* common to pass functions to other functions
* anonymous functions as arguments
* parentheses are ***required*** to invoke functions
  * Otherwise, JS wouldn't be able to tell when you just want
    to pass a function to something instead of invoke it
* js object is equivalent to a ruby hash
* js objects can have functions as values called methods
* objects created via **Object Literals** or constructors (coming up)
* can access object attributes with [] or . notations
  * Can only use . if attribute name is valid JS identifier
* Properties (keys) in JS objects are always strings

---

these are _almost_ the same:
```javascript
var fun = function (name) {
};
function fun(name) {
}
```
---

demo that functions are just values of objects with this
```javascript
var cat = {
  name: "Breakfast",
  age: 8,
  purr: function () {
    console.log("meow!");
  },
  age_one_year: function () {
    this.age += 1;
  }
};

cat.purr(); // logs 'meow!'
cat.age_one_year(); // ages cat one year
var catPurrFunction = cat['purr'];
// call the function
catPurrFunction();
```

---

## `this`
* `this` is a lot like self. through the this variable a method can access the
  object that called it.
* `this` is not optional, unlike `self` in Ruby
* Value of this referred to as the function's **Context**
* object.method(args, arg...) because we use the dot notation the `this`
  variable gets set with object.

---

## classes
* no traditional class system
* use constructor function (invoked with special `new` keyword)
* calls the function setting this to a blank object
* constructor returns new instance automatically
* should be named in CamelCase
* instance methods are added to the prototype attribute/object of an object
  * Prototype is simply another object
* instances have cat.__proto__ which points to Cat.prototype

---

### Constructor Steps
`var cat = new Cat();`

1. new blank obj created
2. set special cat.__proto__ to Cat.prototype
3. run code in body of Cat sets this to blank obj
4. returns obj and sets to cat var. ignoring return value of Cat fn.

---

### Prototype
Demo adding methods to a class using `.protoype`
```
String.prototype.myExclamation = function () {
  return this + "!"
}
```
Mention the MDN docs on `Array.prototype` and `String.prototype` etc.

* Should add methods to a constructor's prototype

---

### Method Steps
`cat.meow`

0. looks in cat obj for meow
0. doesn't find so accesses __proto__ and searches Cat.prototype for meow
0. Cat.prototype.meow is defined and is returned
0. meow is called on cat method style so this is set to cat

---

## Scope
* Scope: What variables are accessible in a given place in code
* scopes are nested
* the set of variables available inside the method:
  * args, local vars, vars declared when the function was first defined
* Scope primarily formed by functions

---

## Closure

A function which accesses variables that were neither passed in nor defined
inside that function.

* free variables are variables neither declared, nor passed as arguments to the
  function.
* a closure is a function that captures these free variables and "closes" over
  them.
* used to create private state
* Are formed when a function is *defined*, not when it is invoked.
---

## Pop Quiz!

+ Which functions are closures?
+ Name the free variables.
```
var a = 0;
setTimeout(function fun1() {
  var b = 2;
  console.log(a, b);
}, 0);

var fun2 = function () {
  var c = 7;
  function fun3() {
    console.log(c);
    return "i like warm hugs";
  }
  
  return fun3();
}
var d = fun2();
```

---

```javascript
var randomFactory = function() {
  var randomNum = 0;

  var getNum = function() {
    return randomNum;
  };

  var getNewNum = function() {
    randomNum = Math.random();
    return randomNum;
  };

  return {
    getNewNum: getNewNum,
    getNum: getNum
  };
};

var randomMaker = randomFactory();

console.log(randomMaker.getNum());
console.log(randomMaker.getNewNum());
console.log(randomMaker.getNum());
```
* a convention in js is to name "private" attributes with leading underscore

---

### Global Scope
* Avoid it
  * Ideally, just one per app
* Watch out for accidental globals
* Global variables become properties of global object
  * `window` or `global`

---

# Project
## Intro JS Exercises

---

## Gotchas

*  Anonymous function callbacks: People fall in the habit of making every
   callback an anonymous function.  I want to get them more in the habit of
passing functions around as objects: that they see callbacks as variables that
they call later.  If students write callbacks as anonymous functions, I think
it's easy for them to fall into the trap of thinking that the callback runs
sequentially and using the parameters as just another variable.

In code form:

--someFunc(arg1, function(callback_param){})

*  Students sometimes treat callback_param like gets.chomp. They don't realize
   that they don't have access to callback_param until someFunc calls the
anonymous function.

