const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});




// function Fish(moniker) {
//   this.moniker = moniker;
//
// }
//
// // ... = REST OPERATOR (when in function in definition)
// // ... = SPREAD OPERATOR (when used in function CALL)
//
// Fish.prototype.swim = function (origin, destination) {
//   console.log(`${this.moniker} is swimming from the ${origin} to the ${destination}`);
// };
//
// Fish.prototype.gillIt = function () {
//   debugger;
//   console.log(`${this.moniker} is gilling it!!!`);
// };
//
//
// function Dog(moniker) {
//   this.moniker = moniker;
// }
//
// Dog.prototype.bark = function (thing1, thing2) {
//   console.log(`${this.moniker} is barking at ${thing1} and ${thing2}`);
// };
//
// // const nemo = new Fish("Nemo");
// // goldfish.swim("window", "walls");
//
//
//
//
// // WAYS TO INVOKE FUNCTIONS AND THEIR CONSEQUENCES
//
// // 1. Constructor Style
// //   const nemo = new Fish('nemo');
// //   // this = new object, instance of that class
// //
// //
// // // 2. Method Style
// //   nemo.swim('window', 'wall');
//   // this = the caller, the thing before the dot
// //
// // // 3. Function Style
// //   sayHi();
// // this = the window! (the global object/scope)
// //
// //  4. Apply Style
//   // this = the first argument passed to apply
//   const nemo = new Fish('nemo');
//   // const champ = new Dog('champ');
//   // nemo.swim.apply(champ, ['window', 'wall']);
//
// // 5. Call Style
//   // this = the first argument passed to call
//   // nemo.gillIt.call(nemo);
//   // nemo.swim.call(champ, 'window', 'walls');
//
// // (6. Gungam Style)
//
//
//
// function sayHi() {
//   console.log("Hello, Moto");
// }
//
// // nemo.swim("window", "wall");
// // const hans = new Fish("Hans Grouper");
// // const scramp = new Dog("Scramp");
//
// // APPLY AND CALL
//
//
// function times(numTimes, callback) {
//   for (let i = 0; i < numTimes; i++) {
//     callback();
//   }
// }
//
// // times(3, nemo.gillIt);
// // returns 'undefined is gilling It'
//
//
// // times(3, function() {
// //   debugger;
// //   nemo.gillIt();
// // });
// // this allows us to call the function method style
//
// //
// // times(3, nemo.swim.bind(nemo, 'window', 'walls'));
// // times(3, nemo.swim.bind(champ, 'window', 'doghouse'));
// // BIND does not run the function - it returns a NEW
// // function that is a copy with the context set by the argument you passed
// // to bind
//
//
// Fish.prototype.doLaps = function (num) {
//   // const func = this.swim.bind(this, 'windows', 'walls');
//   // times(num, func);
//
//   // Old School approach to solving this issue:
//   // const that = this;
//   // times(num, function() {
//   //   that.swim('window', 'walls');
//   // });
//
//   //  times(num, function() {
//   //   this.swim('window', 'walls');
//   // }.bind(this));
//
//   // SHINY NEW ES6 SOLUTION:
//   times(num, (origin, destination) => this.swim(origin, destination));
// };

function askWhatUp() {
  reader.question("What's up?", function(answer) {
    console.log(`No, ${answer} is not up. The sky is up`);
    reader.question("What's down?", function(answer) {
      console.log(`No, ${answer} is not down. The GROUND IS DOWN.`);
      reader.close();
    });
  });
}

askWhatUp();
