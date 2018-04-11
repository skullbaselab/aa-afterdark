// =============== RUBY vs JS ===============
//  falsey values
// ruby: nil, false
// JS: 0, "", null, undefined, NaN, false, -0

//  returns
// ruby: implicit returns
// JS: no implicit returns (except es6 kind of)

//  comparisons
// ruby: ==
// JS: == (does type conversion),  === (checks if oth objects are the same)

//  naming conventions
// ruby: snake_case
// JS: camelCase

//  end of expression
// JS: end with semicolons
// const x = function (num) {return 3 * num};

//  argument enforcement
// js doesn't care if you have the wrong num of arguments
// const y = function(a, b) {
//   console.log(`first: ${a}, second: ${b}`);
// };
// y("hi") will still work

// =============== DATA TYPES ===============
//  Primitives (immutable)
// numbers, strings, booleans, null, undefined

//  Objects
// arrays, functions, objects (aka hashes in ruby)

// ======= VARIABLE DECLARATION / scoping and re-assigning ======
// const: block-scoped, cannot reassign
// let: also block-scoped, can reassign
// var: function-scoped, can reassign

// use const until you have to reassign it, then switch to let
//
// function varChecker () {
//   if (true) {
//     var food = "pizza";
//   }
//   console.log(food);
// }

//
// =============== HOISTING ===============
// allows you to invoke a function before it's defined
// all *named* functions will be hoisted
//
// choose("a", "b"); this works up here
// otherChoose("a", "b"); this doesn't work up here
//
// function choose(a, b) {
//   console.log("whats up");
// }
//
// const otherChoose = function(a, b) {
//  console.log("not hoisted");
// }

// in ruby:
// when defining a class with instance methods that use other instance methods, we aren't invoking
// those methods before they're defined. we're just defining a method.
// all method definitions will be loaded wherever they're used before they're actually called
//
// =============== FUNCTION DECLARATION ===============
// named functions:
function namedFunc () {
  console.log("i am Ms. Named");
}

// anonymous functions:
const anonymousFunc = function () {
  console.log("i am Mr. Anonymous!");
}; //semicolon here because we're setting a variable, ie it's an expression

// fat arrow functions (type of anon func)

const fatArrow = () => {
  console.log("i am Dr. Fat Arrow");
};

//
// =============== FUNCTION INVOCATION / this ===============

// CONSTRUCTOR STYLE (like ruby's initialize for a class)
function Kitten (title) {
  // "this" is the new object we're creating
  this.title = title;
}

const garfield = new Kitten("garfield");

// METHOD STYLE
// adding an "instance method"
Kitten.prototype.meow = function () {
  // "this" is the kitten object the function is called on
  console.log(`${this.title} is meowing`);
};


// FUNCTION STYLE
// this is the window in any function invoked function-style
const sayHi = function () {
  console.log("function stylin");
};

sayHi(); //invoking function style here

// =============== CALLBACKS & CLOSURE ===============
// a function received by another function as an argument, to be called in that function

function invokeCallback (callback) {
  callback();
}

function someCallbackFunction () {
  console.log("calling back");
}

invokeCallback(someCallbackFunction);

const logIt = function (el) {
  console.log(el);
};

const array = [1,2,3,'piano', 'banana'];

array.forEach(logIt);

// below passing in an anon function as the callback, does same as above;
array.forEach((el) => {
  console.log(el);
});

// you only have access to stuff defined in your scope or above you,
// not in more specific scopes
function myClosure () {
  const arr = [];
  function closingOver () {
    arr.push(1000000);
    console.log(arr);
    // now you can modify arr outside of myClosure
    // by using the closingOver function, which is returned by myClosure
  }
  return closingOver;
}








// end of doc
