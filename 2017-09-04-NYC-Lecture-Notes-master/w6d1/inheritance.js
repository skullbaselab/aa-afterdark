function Animal(name) {
  this.name = name;
}

Animal.prototype.move = function () {
  console.log(`${this.name} is moving!`);
};

function Surrogate(){}
Surrogate.prototype = Animal.prototype;
Dog.prototype = new Surrogate();
Dog.prototype.constructor = Dog;

// good but we'll do better!
// Dog.prototype = new Animal();

// no good.
// Dog.prototype = Animal.prototype;

function Dog(name, breed) {
  Animal.call(this, name);
  // this.Animal(name)
  // this.name = name;
  this.breed = breed;
}
// Dog.prototype.move = function() {
//   console.log(`${this.name} is moving!`);
// };

// Dog.prototype.bark = function() {
//   console.log(`This dog barks like a ${this.breed}`);
// };



// BELOW ES6 SYNTAX
// class Dog extends Animal {
//   constructor (name, breed) {
//     super(name);
//     this.breed = breed;
//   }
//
//   bark() {
//     console.log(`This dog barks like a ${this.breed}`);
//   }
// }
















// comment
