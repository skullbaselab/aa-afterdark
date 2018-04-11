// Solutions extract:
// myMap
Array.prototype.myMap = function (func) {
  let mappedArray = [];
  // this.myEach(element => mappedArray.push(func(element)) );
  // ^ super cool one liner. but let's write this out longhand!
  for (let i = 0, n = this.length; i < n; i++) {
  // `n` caches the this.length amount. & var `n` is now available in this scope.
  // for (let i = 0; i < this.length; i++) {  <-- also fine!
    let el = this[i];
    let mappedEl = func(el);
    mappedArray.push(mappedEl);
  }

  return mappedArray;
};

// Actual lecture!


// aside: why use const? state your intention in your code.
    // const = can't touch this.
    // let = we might be reassigning this.


const Cat = function (name) {
 this.title = name;
 this.fatMeow = () => console.log(`${this.title} is meowing`);
 this.meow = function meowing() {
  //  note: this function would work the same if you hadn't named
    // it meowing, if you kept it anonymous.
    // but making it a named function makes debugging long stack traces
    // much easier.
   console.log(`${this.title} is meowing`);
 };
 this.sum = function summing(num1, num2) {
   console.log(`${this.title} has deduced the sum is ${num1 + num2}`);
 };
};

const Dog = function (name) {
 this.title = name;
 this.bark = function barking() {
   console.log(`${this.title} is barking`);
 };
};

let wampus;
let rufus;

const createPets = function (catName, dogName) {
 wampus = new Cat(catName);
 rufus = new Dog(dogName);
 // what is `this`? THE WINDOW!
};

// Ways to call a function!

// 1) Function style.
  // what is `this`? the window!
  // example: createPets("Wampus", "Rufus");
createPets("Wampus", "Rufus");

// 2) Method style.
  // what is `this`? the object the method was called on!
  // example: rufus.bark();
// rufus.bark();

// 3) Constructor style.
  // what is `this`? the new empty object you're creating!
  // what makes that happen? the `new` keyword.
  // example: let luna = new Dog("Lunapuppy");

// 4) Call style.
  // call is a function you call ON A FUNCTION and
  // manually assign the context.
  // example: const detachedBark = rufus.bark;
  // console.log(detachedBark);

// detachedBark(); // ==> "undefined is barking" because window.title is undefined

// detachedBark.call(wampus);
// WAMPUS IS BARKING.

// const detachedSum = wampus.sum;
// console.log(detachedSum);
// detachedSum.call(rufus, 3, 4)
// RUFUS CAN DO MATH.

// 5) Apply style.
  // same as call, but arguments after context argument
    // come in as an array.
    // detachedSum.apply(rufus, [3, 4]);



// const detachedBark = rufus.bark;
//
// function times (numTimes, func) {
//   let i = 0;
//   while (i < numTimes) {
//     func(); // callback is invoked FUNCTION STYLE
//     i++;
//   }
// }
//
// function sayHi () {
//   console.log("Hi!");
// }
//
// const wampusBark = detachedBark.bind(wampus);
//
// times(3, wampusBark);
//

const detachedFatMeow = wampus.fatMeow;
// detachedFatMeow();
// wampus.fatMeow();

// ^ these two things do the same thing.
  // difference is, detachedFatMeow can be called as a callback (which are always
  // invoked function style) without passing wampus the object along too.

// ES6: fat arrow automatically binds to whatever `this` was when that fat arrow
  // function was defined.


// bind v. call and apply ?
// call and apply invoke the function with the context you supply.
// bind returns a new, uninvoked function with the context set as you have specified.
// you can then invoke your new bound function later on.


// Note: it's on you as developer to make sure that the context you're
  // supplying in bind, call, or apply can work with the function in question.
  // e.g.: if you get "undefined is barking" it's on you! :|














// Readline


// Async example using readline library

const readline = require("readline");
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// format: reader.question(string, callback)
function queryCuteness () {
  reader.question("Who's the cutest puppy in the world?\n", function (response) {
    if (response === "Luna") {
      console.log("correct!\n");
      reader.close();
    } else {
      console.log("yeah right try again!\n");
      queryCuteness();
    }
  })
}

queryCuteness();


// readline gotcha:
  // reader.close() has to be inside the callback to reader.question in order
  // to have this all happen asynchronously


// rule for today:
  // make everything work
