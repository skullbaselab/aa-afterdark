// ES5

//We capitalize constructor functions
function Cat(moniker, coatColor, age) {
  this.moniker = moniker;
  this.coatColor = coatColor;
  this.age = age;
  //`this` refers to particular instance of cat we are creating

  //This function is defined anew every time a new cat is constructed
  //Prefer defining methods on the prototype/constructor
  // this.meow = function () {
  //   console.log(`${this.moniker} meows`);
  // }; //Not good!
}
//Define instance methods on prototype
Cat.prototype.meow = function () {
  console.log(`${this.moniker} meows`);
};

//Define class method on constructor
Cat.generateSennacy = function () {
  return new Cat("Sennacy", "brown", 50);
};

const numa = new Cat("Numa", "black", 5);
