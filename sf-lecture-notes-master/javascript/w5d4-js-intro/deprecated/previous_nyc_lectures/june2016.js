// NOTE: Index.html
// <!DOCTYPE html>
// <html>
//   <head>
//     <script src="notes.js" charset="utf-8"></script>
//     <meta charset="utf-8">
//     <title></title>
//   </head>
//   <body>
//     Hey, Javascript Notes.
//   </body>
// </html>


// NOTE: notes.js

// console.log("Welcome to notes");
// console.log(!0);
// console.log(!NaN);
// console.log(!"");
// console.log(!null);
// console.log(!undefined);
// console.log(!false);

// Differences
// 1) Use === not ==
// 2) Primitive types
// 3) Old-fashioned way, no classes
// 4) No do end blocks
// 5) Semicolons, semicolons, semicolons
// 6) There is no argument error

// need semicolon after closing curly brace to let js know  you're finished with assignment
let funFunc = function () {
  return "So much fun";
};

function funFunk() {
  return "So much fun";
}

let original = [1, 2, 3];
let mapped = original.map(function (el, index, theArray) {
  original === theArray; //true
  return el * index;
});
let favFood = "Taco";
if (true) {
  let favFood = "Pizza";
  // console.log(favFood);
}
// console.log(favFood);

// Method style (this, in the context of the function, will be whatever the function is called upon)
// Function style
// Constructor style


// let cat = {
//   name: "Paprika",
//   meow: function () {
//     console.log(`${this.name} is meowing`);
//   }
// };

// Method Style
// cat.meow();

// let meowFunc = cat.meow;
// Function Style
// meowFunc();

// inside constuctor function, this is blank object
function Cat(name) {
  this.name = name;
}

// Constructor Style
let sennacy = new Cat("Sennacy");
Cat.prototype.meow = function () {
  // AARDVARK = 'arthur'; //puts on window
  console.log(`${this.name} is meowing`);
};

Cat.prototype.furry = true;

// Fat Arrows
// 1) Method Style (context(what "this" refers to) doesn't change)
// 2) Function Style (context doesn't change)
// 3) Constructor Style (can't do this)
