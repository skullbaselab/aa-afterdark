// WANT
// copley                 Dog.prototype                Animal.prototype
// {                        {                            {
//   name: "copley",        bark: function () {},        eat: function () {},
//   __proto__: ->            __proto__: ->                constructor: Animal
//                            constructor: Dog
// }                        }                            }
//
// ES6 way:
// class Animal {
//   constructor(name) {
//     this.name = name;
//   }
//
//   eat() {
//     console.log(`${this.name} is eating!`);
//   }
// }
//
// class Dog extends Animal {
//   constructor(name) {
//     super(name);
//   }
//
//   bark() {
//     console.log(`${this.name} says woof!`);
//   }
// }

function Animal(name) {
  this.name = name;
  console.log('hello from the animal class');
}

Animal.prototype.eat = function() {
  console.log(`${this.name} is eating!`);
};

// Make Dog inherit from Animal
//
// Bad ES5 way:
// Dog.prototype = Animal.prototype;

// Decent ES5 way:
// inefficient if making a new Animal is expensive
// Dog.prototype = new Animal();
//
// Good ES5 way, but opaque:
// doesn't actually run the constructor function
// Dog.prototype = Object.create(Animal.prototype);
//
// Our recommendation: the Surrogate way!
// ...

function Dog(name) {
  // equivalent of calling super(name)
  Animal.call(this, name);
}



function Surrogate() {}
Surrogate.prototype = Animal.prototype;
Dog.prototype = new Surrogate();
// inheritance already achieved w/o 57, but makes it more clear when we inspect in browser what the constructor func of Dog is
Dog.prototype.constructor = Dog;

Dog.prototype.bark = function() {
  console.log(`${this.name} says woof!`);
};


const copley = new Dog('Copley');

// if your __proto__ points to a class, you are an instance of that class
