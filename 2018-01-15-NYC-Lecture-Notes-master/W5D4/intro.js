// console.log('Hello World!');

//1) Why JavaScript?

//2) Truthiness
  // Falsey vals:
    // - empty string
    // - false
    // - 0
    // - null
    // - NaN
    // - Undefined
    // - -0 (negative zero)
  
//3) Conventions

// camelCase vs snake_case

// Explicit return
// function example() {
//   return 4;
// }

// == vs ===
  // == is a loose check
  // === checks type and value, only works with primitives (not arrays and other objects)

//  semicolons
// use semicolons to denote the end of an expression
// JavaScript is indifferent to newlines, so line 31 immediately invokes the anonymous function defined on line 30
 // const x = function (num) { return 3 * num };
 // (10 + 5) > 20 ? console.log('big') : console.log('small');
 // console.log(x)

//4) Data Types
  // - Object - key-val pairs
    // {"abby": "cool", 'maurice': 'also cool', patrick: 'super cool'}
      // - don't need to explicitly put quotes around key
    // - Function - a function is a special type of object you can invoke
    // - Array
  // Primitives
    // - Number
    // - Boolean
    // - String
    // - Null
    // - Undefined
    // - Symbol

//5) Variable/Function declaration

// var, let, const
// var is function scoped; available in entirety of function scope even if defined inside a block
// const and let are block scoped
// can't reassign consts, but can mutate them


 function example() {
  if (true) {
    let abby = ['extra super cool'];
    abby = 'not cool';
    console.log(abby);
  }
}

// example();

// variable declarations are hoisted; assignment is not
// function statements are also hoisted, so you can invoke them before they are defined in the file

// function expression, function statement

// function statement. this gets hoisted
// function addTwoNumbers(num1, num2 = 4) {
//   return num1 + num2;
// }
// addTwoNumbers(1, 2);
// 
// // this doesn't get hoisted; can't invoke before defined in file
// const addThreeNumbers = function fred(num1, num2, num3) {
//   return num1 + num2 + num3;
// };


//6) Ways to call a function

function func1() {
  console.log(this);
}

// function style
// "this" is always the window/global object
// func1();

// method style
// "this" is the object that the function is being invoked on, aka receiver of the function
const rufus = {
  waaaaaag: function() {
      // debugger
      console.log(`${this.name} is wagging`);
    },
  bark: function() {
    console.log(this);
  },
  name: 'Rufus Firetrux'
};

// dog.waaaaaag();

// constructor style

// capitalized first letter is convention to show its a constructor function
// when invoked w/ new, creates a new empty object and assigns "this" to be that new object
// that object gets returned 
function Dog(name) {
  // debugger
  this.name = name;
}


//7) Callbacks

function hi() {
  console.log('sup');
}

// a callback is just a function that is passed as an argument to another function and invoked in that function
function invoker(func) {
  // it always gets invoked function style
  func();
}
// passing a reference to hi
// invoker(hi);

//8) Closures
  // a function that references a variable declared outside its scope
  

  function dinerBreakfast() {
    let order = "I'd like cheesy scrambled eggs please.";
    console.log(order);
    // debugger
    return function(food) {
      // debugger
      // order was declared in this closure's encompassing function's scope
      order = `${order.slice(0, order.length - 8)} and ${food} please.`;
      console.log(order);
    };
  }
  
  // const closureExample = dinerBreakfast();
  
  function makeCounter() {
    let count = 0;
    return {
      add: function() {
        count++;
        console.log(count);
      },
      subtract: function() {
        count--;
        console.log(count);
      }
    };
  }
  
  const counter = makeCounter();