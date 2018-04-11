// const readline = require('readline');
//
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

function Fish(moniker) {
  // debugger
  this.moniker = moniker;
}

function Dog(moniker) {
  this.moniker = moniker;
}


Fish.prototype.swim = function() {
  console.log(`${this.moniker} is swimming!`);
};

Fish.prototype.gillIt = function (arg) {
  // debugger
  // console.log(arg);
  console.log(`${this.moniker} is gilling it!!!!!!!`);
};


Dog.prototype.bark = function () {
  console.log(`${this.moniker} is barking`);
};

Fish.prototype.swimThenGill = function () {
  // debugger
  this.swim();
  this.gillIt();
};
//
Fish.prototype.doLaps = function (numLaps) {
  // Version 1 (preferred)
  times(numLaps, this.swimThenGill.bind(this));
  // Version 2
  const that = this;
  times(numLaps, function () {
    that.swimThenGill();
  });
  // Version 3
  times(numLaps, function () {
    this.swimThenGill();
  }.bind(this));
  // Version 4 (preferred)
  times(numLaps, () => {
    this.swimThenGill();
  });
};
//
function times(numTimes, callback) {
  // debugger
  for (let i = 0; i < numTimes; i++) {
    callback();
  }
}
// // WAYS TO INVOKE A FUNCTION AND THEIR CONSEQUENCES
//
// // 1. constructor-style:
//   // const fish = new Fish("Nemo");
//   // const newFish = new Fish("Dory");
// // context is new object of constructor type
// // 2. method-style:
// //   fish.gillIt();
//   // fish.doLaps(5);
//   // newFish.doLaps(10);
// // context is receiver (fish)
//
// // 3. function-style:
// //   times(5, () => console.log("hey"));
// // context is window



// ASYNCHRONICITY
// function youLikeJS() {
//   reader.question("Do you like javascript yet?\n", function(answer) {
//     if (answer === "yes") {
//       console.log("Wow that didn't take very long!");
//       reader.close();
//     } else {
//       reader.question("What's taking so long??", function(answer) {
//         console.log("I'm sure you'll love it soon!");
//         reader.close();
//       });
//     }
//   });
// }

//
// function askEverybody(howMany) {
//   reader.question("What's your name\n", function(yourName) {
//     howMany--;
//     console.log(`Hello ${yourName}`);
//     if (howMany > 0) {
//       askEverybody(howMany);
//     } else {
//       reader.close();
//     }
//   });
// }
