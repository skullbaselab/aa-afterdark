function Cat(title, color) {
  this.title = title;
  this.color = color;
}

function Dog(title, breed) {
  this.title = title;
  this.breed = breed;
}

function Animal() {
  this.title = "super complicated code";
}

Animal.prototype.eat = function () {
  return "nom nom nom";
};

Animal.prototype.sleep = function () {
  return "zzzzzzz....";
};


// 1) Naive solution
// Cat.prototype = Animal.prototype;

// 2) Better (but still bad) solution
// gives us __proto__ that points to Animal prototype
// Cat.prototype = new Animal();
// Cat.prototype.constructor = Cat;

// 3) Best way
function Surrogate() {}
Surrogate.prototype = Animal.prototype;
Cat.prototype = new Surrogate();
Cat.prototype.constructor = Cat;











Cat.prototype.meow = function () {
  return "meow";
};
const sennacy = new Cat("Sennacy", "orange");
