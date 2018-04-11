const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const sayHey = function(repetitions) {
  console.log("hey");
};

const Fish = function (name) {
  this.name = name;

  // this.swim = function () { // bad because we make a new method every time we create a Fish
  //   console.log(`${this.name} is swimming`);
  //   // return `${this.name} is swimming and ${first} and ${then}`;
  // };
};

Fish.prototype.swim = function (first, then) {
  console.log(`${this.name} is swimming`);
  // console.log(`${this.name} is swimming and ${first} and ${then} and ${another}`);
};

// class Fish {
//   constructor(name) {
//     this.name = name;
//   }
//
//   swim() {
//     debugger
//     console.log(`${this.name} is swimming`);
//     // console.log(`${this.name} is swimming and ${first} and ${then}`);
//   }
// }

const Dog = function (name) {
  this.name = name;
};

Dog.prototype.bark = function () {
  console.log(`${this.name} is barking`);
  // return `${this.name} is barking and ${first} and ${then}`;
};

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
//
//   bark(first, then) {
//     // console.log(`${this.name} is barking`);
//     console.log(`${this.name} is barking and ${first} and ${then}`);
//   }
//
//   static stuff() {
//     console.log('stuff');
//   }
// }

const goldfish = new Fish("goldfish"); // constructor style!
const grouper = new Fish("Hans Grouper");
const lassie = new Dog("Lassie"); // also constructor style!
const doggie = new Dog("doggie");

// goldfish.swim(); // method style! => `this` is the object we've called the method on
// lassie.bark();
//
// sayHey(); // function style!

const args = ["jumping", "waving"];
// goldfish.swim.apply(lassie, args);
// lassie.bark.call(goldfish, ...args);
//
// const detachedSwim = goldfish.swim; // storing the function here
//
// const detachedSwim = function () {
//   goldfish.swim();
// };
//
// // NO DOUBLE BINDING
const detachedSwim = goldfish.swim.bind(lassie); // returns a function bound to lassie
// detachedSwim(); // invoked function style => `this` is now the global object
//

//
// times(3, detachedSwim);
//
// Fish.prototype.swimAway = function () {
//   times(3, this.swim.bind(this));
// };
//
// Fish.prototype.swimAway = function () {
//   const that = this; // storing context in a variable
//   times(3, function () {
//     that.swim();
//   });
// };
// //
// Fish.prototype.swimAway = function () {
//   times(3, () => {
//     this.swim(); // works because fat arrow automatically binds `this`
//   });
// };
//
// goldfish.swimAway();

// reader.question("What is the meaning of life?", function (answer) {
//   console.log(`Nope! ${answer.toUpperCase()} is not the meaning of life`);
//   reader.close(); // inside the callback
// });
// //
// console.log("We didn't get an answer yet");

const times = function (num, callback) {
  let i = 0;
  while(i < num) {
    callback(); // always consider the context of your callbacks
    console.log(i);
    i++;
  }
};

// times(3, function () {
//   reader.question("What is the meaning of life?", function (answer) {
//     console.log(`Nope! ${answer.toUpperCase()} is not the meaning of life`);
//     reader.close();
//   });
// });

function askSameQuestionManyTimes(numTimes) {
  if (numTimes > 0) {
    reader.question("What is the meaning of life?", function (answer) {
      console.log(`Nope! ${answer.toUpperCase()} is not the meaning of life`);
      askSameQuestionManyTimes(numTimes - 1); // call it again in the callback!
    });
  } else {
    console.log('Done asking questions!');
    reader.close();
  }
}

askSameQuestionManyTimes(4);
