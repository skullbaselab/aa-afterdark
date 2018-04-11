// Human.prototype = Animal.prototype; //Apes could ruin the Earth!

// =========es5 way===================
Function.prototype.inherits = function (parentClass) {
  function Surrogate() {}
  Surrogate.prototype = parentClass.prototype;
  this.prototype = new Surrogate();
  // this.prototype.__proto__ = parentClass.prototype
  // this.prototype = new Animal(); Don't do this to avoid a possibly expensive Animal constructor function
  this.prototype.constructor = this;
};

// Human.inherits(Animal); //must call before Human.prototype function definitions

function Human(name, disposition) {
  // this.disposition = disposition;
  Animal.call(this, disposition);
  this.name = name;
}

function Animal(disposition) {
  this.disposition = disposition;
}
//
Animal.prototype.chill = function () {
  console.log(`I am ${this.disposition} and am just chilling`);
};

Human.prototype.chill = function () {
  console.log(`I'm drinking a beer`);
};

Human.prototype.ruinEarth = function() {
  console.log(`I am ${this.disposition} and I will ruin the Earth`);
};

// ======es6 way====================
// just syntactic sugar for es5 way

// class Animal {
//   constructor(disposition, furColor) {
//     this.disposition = disposition;
//     this.furColor = furColor;
//   }
//
//   chill() {
//     console.log(`I am ${this.disposition} and am just chilling`);
//   }
// }
//
// class Human extends Animal {
//   constructor(disposition) {
//     super(disposition);
//     // can only use super inside constructor
//     // MUST call super inside the child class constructor before referencing this
//   }
//
//   ruinEarth() {
//     console.log(`I am ${this.disposition} and I will ruin the Earth`);
//   }
// }
