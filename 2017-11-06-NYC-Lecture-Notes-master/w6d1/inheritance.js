
// And on the 6th day, God created an abundance of Talking Animals,
// that they may be used in JavaScript inheritance examples.
//                                      - @angustweets, 10 Apr 2013


// ANIMAL

function Animal(name) {
  this.name = name;
}

Animal.prototype.move = function() {
  console.log(`${this.name} is moving!`);
};

// DOG

// function Dog(name, breed) {
//   Animal.call(this, name);
//   // this.name = name;
//   this.breed = breed;
// }
// below is ES6 syntax for inheritance; just syntactic sugar
class Dog extends Animal {
  constructor(name, breed) {
    super(name);
    this.breed = breed;
  }

  bark() {
  }
}

// don't do below!: if we add functions to the Dog prototype,
// they're actually being added to the Animal prototype

// Dog.prototype = Animal.prototype;
// -----------------------------------------------------------------------------
// don't do below!:
// new Animal() will return a new object with a __proto__ pointing to
// the Animal's prototype
// this is bad because we're unnecessarily making a new Animal, with
// potentially expensive constructor or one that might cause side effects

// Dog.prototype = new Animal();
// -----------------------------------------------------------------------------

function Surrogate() {}
Surrogate.prototype = Animal.prototype;
// do below before defining any functions on Dog prototype to prevent overwriting
Dog.prototype = new Surrogate();

Dog.prototype.bark = function() {
  console.log(`woof woof i am a talking ${this.breed}`);
};

function inherits(childClass, parentClass) {
  // function Surrogate() {}
  // Surrogate.prototype = parentClass.prototype;
  // childClass.prototype = new Surrogate();
  // Object.create is doing above: making new empty object whose __proto__ points to parentClass's prototype
  childClass.prototype = Object.create(parentClass);
  // below is just so an instance of childClass has a reference to what its constructor is
  // kind of like how in Ruby we can use dog.class to get Dog
  // if we don't do this, dog.constructor would give us Animal, but it's not necessary for setting up inheritance
  // (i.e.- new Dog() will still make a new dog, not a new animal)
  childClass.prototype.constructor = childClass;
}

// CAT

function Cat(name) {
  this.name = name;
}
















// So if it's not defined on the prototype of the constructor that constructed it, well
// then it must be defined on the prototype of the constructor function that constructed
// the prototype of the constructor function that constructed this particular object.
//                                                          - Jeff Fiddler, 2016
