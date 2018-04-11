// DIFFERENCES BETWEEN JS AND RUBY
  // in Ruby, everything is a truthy value
      // except for false and nil
  // in JS falsey values include -1, '', 0,
      // NaN, undefined, null, false, -0
  // in Ruby we use snake_case
  // in JS we use camelCase

// DATA TYPES
  // primitives(immutable): numbers, strings, booleans,
      // undefined, and null
  // objects: arrays, functions, objects({})

// VARIABLES
  // declaration keywords:
    // var: is function scoped
    // let: block scoped, and can be reassigned. ES6
    // const: no reassignment, block scoped. ES6
          // const array = []
          // array.push(4) - array is now [4].
  // console.log(hello);
  // const hello = 'Hello, world!'

// FUNCTIONS
  // function declaration:
    // name function declaration:
      // function greeter() {
        // console.log("wyd");
      // }
  // you can only call functions before they're defined if
  // they are name functions

    // constructor function:
      // equivalent of Ruby's Class.
      // function CuteCat() {
      // }

    // fat arrow functions:
      // same as anonymus functions

// INVOCATION
  // method-style invocation:
    // object.function
    // dog.bark()
      // this is equivalent to Ruby's self.
      // the context in which you are in, or object you
      // are currently inside of
  // constructor style invocation:
    // new keyword in front of invocation
    // makes new object.
    // this is going the instance
  // function style invocation
    // invoke a function not called on an object.
    // functionName()

  function Dog(name) {
    this.name = name;
  }

  Dog.prototype.bark = function () {
    console.log('bark');
    console.log(`${this.name} is barking`);
  };
  // instanceOfDog.bark
    // is how we'd call the above
    // defined on the proptotype

  Dog.numberOfLegs = function () {
    return 4;
  };
  // Dog.numberOfLegs()
    // - thats how you'd call the above
    // not defined on the prototype

// CALLBACKS
  // simply a type of function
  // when a function is passed in to another as an arg
  //

// const anArray = [1,2,3,4,5,6];
// const printer = ((num) => {
//   console.log(num);
// });
//
// anArray.forEach(printer);

// CLOSURES
  // another type of function.
  //

function dinerBreakfast() {
  const foods = ["cheesy scrambled eggs"];
  // the anonymous function defined below closes over foods
  return (newFood) => {
    if (newFood) {
      foods.push(`and ${newFood}`);
      return `I'd like ${foods.join(' ')} please.`;
    }
    return `I'd like ${foods.join(' ')} please.`;
  };
}


// console.log(adder(4, 5));
const adder = function (x, y) {
  // return (x + y);
  // always declare variables!
  const temp = x + y;
  return temp;
};

const addition = (x, y) => {
// i am fat arrow function
};



function testFn () {
  var favoriteFood = "pizza";

  if (true) {
    var favoriteFood = "ramen";
    console.log(favoriteFood);
  }

  console.log(favoriteFood);
}

const caller = (callback) => {
  callback();
};














// comment
