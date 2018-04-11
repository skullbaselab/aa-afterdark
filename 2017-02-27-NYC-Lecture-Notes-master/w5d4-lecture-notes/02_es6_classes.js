// ES6

//Syntactic sugar for ES5 class syntax
class Cat {
  constructor(moniker, coatColor, age) {
    this.moniker = moniker;
    this.coatColor = coatColor;
    this.age = age;
  }

  meow () {
    console.log(`${this.moniker} meows`);
  }

  static generateSennacy() {
    return new Cat("Sennacy", "brown", 50);
  }
}
