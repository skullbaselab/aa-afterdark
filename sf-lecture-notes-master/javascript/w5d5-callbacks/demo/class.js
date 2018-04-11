class ClassyHuman {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  birthday() {
    this.age++;
  }
}

ClassyHuman.prototype.birthday = function() {
  this.age++;
  this.age++;
};

const kelly = new ClassyHuman("Kelly", 1000);
console.log(kelly.age);
kelly.birthday();
console.log(kelly.age);
kelly.birthday();
console.log(kelly.age);
