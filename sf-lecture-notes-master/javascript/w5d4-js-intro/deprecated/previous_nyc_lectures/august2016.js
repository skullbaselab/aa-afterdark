//Javascript

// Falsey Values
//   Ruby: nil, false
//   Javascript: 0, -0, undefined, NaN, "", false, null
//
// Invoking functions
//   In Javascript, must invoke function with ()
//
// Explicit return
//   In Javascript, must explicitly return from function
//
// camelCase
//   In Javascript, variables look like thisAwesomeVariable, not this_awesome_variable
//
// semicolons
//   In Javascript, use semicolon to denote end of expression. An expression is a statement
//   that returns some value
//
// const x = function (num) { return 3 * num }
//
// (10 + 5) > 20 ? console.log('big') : console.log('small');
//
// no argument enforcement
//
// you can pass in however many arguments you want. If I pass in only 1 arguments
// expression will be undefined. If I pass in more than 2, they will be unused
const y = function (name, expression) {
  console.log(`${name} says ${expression}!`);
};

// Functions are first-class citizens

const sayHi = function () {
  debugger
  console.log("hi");
};

// function-style invokation
// sayHi();

function giveMeFunc(func) {
  func();
}

// 2) Variable/Function declaration

// Variables

// const (block scoped, can't be reassigned)
// let (block scoped, can be reassigned)
// var (function scoped, can be reassigned)

// Functions

// named Functions
// functions in variables
// anonymous

// constructor functions should start with capital letter to let people know
// that it's a constructor function
function Kitten(title) {
  this.title = title;
}

Kitten.prototype.meow = function () {
  console.log(`${this.title} is meowing`);
};

const wampus = new Kitten("Wampus");
// wampus.meow();

// not invoking wampus.meow because I want the actual function, not the return value
const detachedMeow = wampus.meow;

// this will be window here
detachedMeow();

// Ways to call a function


//function style (this (context) is window)

//method style (this (context) is the object on which you call the method)

//constructor style (must use keyword new. this (context) is empty object)
