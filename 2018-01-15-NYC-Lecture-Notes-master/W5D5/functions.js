// *** Ways to call a function (and how it affects context!) ***

// call style: Function style
// 'this': Global/Window (global: node, window: browser)

// call style: Method style
// 'this': The instance that the method was called on

// call style: Constructor style
// 'this': The object that we are constructing


// Constructor function
function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.meow = function () {
  console.log(`${this.name} is meowing! Meow!`);
};

// const kitty = new Cat('Chicken', 'Jingles');
// // Context is always determined by how the function is invoked
// kitty.meow();

function Dog(name, owner) {
  this.name = name;
  this.owner = owner;
}

// Arrow functions automatically bind context for us!
Dog.prototype.bark = function () {
  console.log('Outside testFunc');
  console.log(this.name);
  const testFunc = function() {
    console.log('Inside testFunc');
    console.log(this.name);
  }.bind(this);
  testFunc();
  // console.log(`${this.name} is barking! Woof!`);
};

function sayHello() {
  console.log('hello world!');
}





// *** Callbacks ***
// A callback is a function that is passed as an arg to another function (uninvoked)
[1, 2, 3].map((el, idx) => {
  const doubled = this[idx] * 2;
  return doubled;
});

function times(callback, num = 1) {
  for(let i = 0; i < num; i++) {
    callback();
  }
}

// *** MORE ways to call a function ***

// Call
// Invokes the function!
// Allows us to redefine the context ('this') of the function
// The first arg is the new context for 'this'
// Additional arguments are the individual args for the function
const doge = new Dog('Oscar', 'Puppers');
const detachedBark = doge.bark;
const kitty = new Cat('Chicken', 'Jingles');
// detachedBark.call(kitty);

// Apply
// Invokes the function!
// Works exactly the same way as Call, however, it expects a maximum of two args
// The second arg is an array of all additional arguments
// detachedBark.apply(kitty);











// *** Bind ***
// Returns an un-invoked function with whatever context you pass in

// Bound meow
// const boundMeow = kitty.meow.bind(kitty);
const boundMeow = Cat.prototype.meow.bind(kitty);
// times(Cat.prototype.meow.bind(kitty), 3);


//  Arrow functions automatically bind context for us!







// *** ES6 Class Syntax ***

// Syntactic sugar
// class Cat {
//   constructor(name, owner) {
//     this.name = name;
//     this.owner = owner;
//   }
//
//   meow() {
//     console.log(`${this.name} is meowing! Meow!`);
//   }
//
//   // static thing = 'some value';
// }

// Cat.thing = 'some value';
