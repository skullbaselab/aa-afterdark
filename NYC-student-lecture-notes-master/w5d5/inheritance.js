function Animal(species) {
  this.species = species;

  const expensiveComputation = () => {
    let i = 0;
    while (i < 3000000000) {
      i++;
    }
  };

  // expensiveComputation();
}

Animal.prototype.exist = function () {
  return `${this.title}'s existing intensifies`;
};

function Cat(title, color) {
  this.title = title;
  this.color = color;
}

// naive solution
// Cat.prototype = Animal.prototype;
// Cat.prototype = new Animal();

// ES5 way
function Surrogate() {}
Surrogate.prototype = Animal.prototype;
Cat.prototype = new Surrogate();
Cat.prototype.constructor = Cat;

// this does essantially the same thing
// Cat.prototype = Object.create(Animal.prototype);

Cat.prototype.meow = function () {
  return 'meow';
};

const animaniac = new Animal();
const wampus = new Cat('Wampus', 'tuxedo');

// ES6 way
class Animal {
  constructor(title) {
    this.title = title;
  }

  exist() {
    return `${this.title}'s existing intensifies`;
  }
}

class Cat extends Animal {
  constructor(title, color) {
    super(title);
    this.color = color;
  }

  meow() {
    return 'mrrrreow';
  }
}

const animaniac = new Animal('Quintessential Animal');
const wampus = new Cat('Wampus', 'tuxedo');
