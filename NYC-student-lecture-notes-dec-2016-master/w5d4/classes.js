/*
Let's make a User class with username, password
*/

// ES5
// function Cat (name) {
//   this.name = name;
//   // unnecessary to make a purr for every instance
//   // this.purr = function() {
//   //   console.log(`${this.name} purrs`);
//   // }
// }
//
// // Cat.prototype.purr = function () {
// //   console.log(`${this.name} purrs`);
// // };
//
// function Scientist (name) {
//   this.name = name;
// }
//
// Scientist.prototype.beScientist = function () {
//   console.log(`${this.name} is being a scientist`);
// }
//
// Scientist.prototype.doExperiment = function (experiment) {
//   experiment();
// }
//
// // new creates a new empty object
// // assigns `this` to that object
// // returns object after code is run
//
// const wampus = new Cat("wampus");
// console.log(wampus);
//
// wampus.purr = function superPurr() {
//   console.log(`${this.name} meows`);
// }

// wampus.purr()
// superPurr();

// we invoke the local purr rather than the prototype
// Wampus.purr();

// ES6

class Cat {
  constructor (name) {
    this.name = name;
  }

  purr () {
    console.log(`${this.name} purrs`);
  }

}

class Scientist {
  constructor (name) {
    this.name = name;
  }
  // static peerReview() {
  //   console.log("peer reviewed");
  // }

  beScientist () {
    console.log(`${this.name} is being a scientist`);
  }

  doExperiment (experiment) {
    experiment();
  }

}
// trying `class Scientist` again would throw an error
// because it's already defined

// some other file...
// Cat.prototype.meow = function() {
//   console.log('meow')
// }

// const chloe = new Cat('chloe');
// chloe.chloeMeow = function() {console.log("meeeow")}

// chloe.purr();
Scientist.peerReview = function() {
  console.log("heeey what's up good science");
}
// Scientist.peerReview();

const meagan = new Scientist("Meagan");
console.log(meagan.peerReview);
