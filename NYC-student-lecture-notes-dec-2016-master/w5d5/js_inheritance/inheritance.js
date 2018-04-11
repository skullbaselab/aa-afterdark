// ES5

function inherits(child, parent) {
  function Surrogate() {};
  Surrogate.prototype = parent.prototype;
  child.prototype = new Surrogate();
  child.prototype.constructor = child;
}

function Animal(name, color, numLegs) {
  this.name = name;
  this.color = color;
  this.numLegs = numLegs
}

function Cat(name, color) {
  Animal.call(this, name, color, 4);
}

inherits(Cat, Animal);

Cat.prototype.meow = function meow() {
  return "meow";
}

// ES6

class Animal {

  constructor(name, color, numLegs) {
    this.name = name;
    this.color = color;
    this.numLegs = numLegs
  }
}

class Cat extends Animal {

  constructor(name, color) {
    super(name, color, 4);
  }

  meow() {
    return "meow";
  }
}
