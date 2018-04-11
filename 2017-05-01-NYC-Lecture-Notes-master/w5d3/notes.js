// JavaScript notes

// USE INDEX.HTML TO TEST


// Why JavaScript?



// Falsey values (can you name them all?)

const falseyValues = [NaN, '', 0, false, null, undefined, -0];



// Testing for equality
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_sameness
//
// '' == 0;
// [1, 2, 3] == '1,2,3';
// [] == 0;
// {} === {};



// Everything is an object (jk)
//
// Primitives:
// number
// string
// boolean
// undefined
// null
//
// Not Primitives:
// array
// NaN



// camelCase

const noMoreSnek = '🚫🐍';

function writeFunctionsAndVariablesLikeThis () {
  return 'ok cool';
}



// Semicolons (use them)



// Variables

// GLOBAL. VERY BAD
variable = "thing";

// CANNOT REASSIGN. CAN MUTATE
const numbers = [4, 8, 15, 16, 23, 42];

// CAN REASSIGN
let address = '598 Broadway';
address = '159 W 25th St';

function scopingDemo() {
  if (true) {
    const stubborn = "I CANT CHANGE";
    let whatever = "ANYTHING";

    // var is function scoped
    var oldskool = "Nas";
    oldskool = "Biggie";
    console.log(address);

  }
  console.log(oldskool);
}



// Hoisting

// FUNCTIONS ARE HOISTED WITH THEIR BODY
hoistingDemo();

function hoistingDemo() {
  const bagelsRGood = true;
  console.log(bagelsRGood);
}



// Returning from functions

function square(x) {
  return x * x;
}



// Arguments

function doNotArgueWithMe() {
  console.log('It will not make a difference');
}

function helloStranger(stranger) {
  console.log(`Hello, ${stranger}`);
}



// Functions as first-class citizens

function two() {
  return 2;
}

function four() {
  return 4;
}

function addTwoNums(num1, num2) {
  return num1 + num2;
}

function automobile() { console.log('🚘'); }



// Anonymous function declaration

// helloWorld();

const helloWorld = function() {
  // console.log(this);
  console.log('Hello World');
};

const holaMundo = () => {
  console.log('Hola Mundo');
};



// `this` in different function invocations


function Cat(name) {
  // debugger
  this.name = name;
}

Cat.prototype.hello = function () {
  console.log(`${this.name} says hello`);
};

// Constructor-Style.
const cat = new Cat("Orpheus");


// Method-Style. this is whatever's before the dot
// cat.hello();

// Function-Style. Callbacks are always invoked function-style. this is the window.
// helloWorld();


// Callbacks - function that can be passed to another function as an argument

function funcInvoker(func) {
  func();
}

const callback = el => console.log(el + 1)

[1, 2, 3, 4, 5].forEach(callback)



// Closures - function that captures in-scope variables

function counter(inc) {
  let count = 0;

  return function() {
    count += inc;
    console.log(`Invoked ${count} time(s)`);
  };
}

// CLOSURE MAGIC
var counterrr = counter(1);
counterrr();



// Homework & Quiz

// https://www.destroyallsoftware.com/talks/wat
