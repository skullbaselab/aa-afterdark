function Animal(name, age, color, favFood) {
  this.name = name;
  this.age = age;
  this.color = color;
  this.favFood = favFood;
}

Animal.prototype.live = function () {
  console.log(`I am ${this.name} and I am alive`);
};
// BAD :(
// currently setting squirrel prototype = to animal prototype
// failing to make our chain. Now both prototypes point
// to the same object, changing one affects the other :(
// Squirrel.prototype = Animal.prototype;

// Surrogate Method
// old, but still relevant and in a lot of code bases out in the wild
// Order matters! Make changes to your inheritance chain before adding
// object specific prototype changes
function Surrogate(){}

// Plain English def of being an instance of an object:
// Being an instance of something, is having your __proto__
// set to that object's prototype

// Surrogate.prototype = Animal.prototype;
// Squirrel.prototype = new Surrogate();
// Squirrel.prototype.constructor = Squirrel;

// Object.create is current 'preferred' method of obtaining
// prototype inheritance in ES5
Squirrel.prototype = Object.create(Animal.prototype);
//
//
function Squirrel(name, age, color, favFood) {
  // ES5 syntax for mimicing 'super'
  // (Does not handle prototype inheritance in any manner)
  Animal.call(this, name, age, color, favFood);
  // this.name = name;
}
//
// Squirrel.prototype.magicNumber = 75;
Squirrel.prototype.stockUp = function() {
  console.log(`I am ${this.name} and I'm stocking up for the winter`);
};

// ES6 Class Syntax
// class Animal {
//
//   constructor(name){
//     this.name = name;
//   }
//
//   live(){
//     console.log(`I am ${this.name} and I am alive`);
//   }
//
// }

// class Squirrel extends Animal {
//   constructor(name) {
//     super(name);
//   }
//
//   // get basically turns this function into a property
//   // look it up in the docs :)
//   get magicNumber() {
//     return 75;
//   }
//
//   stockUp(){
//     console.log(`I am ${this.name} and I'm stocking up for the winter`);
//   }
//
//   live(){
//     super.live();
//     console.log(`but only for one year :(`);
//   }
//
// }














// bottom of file
