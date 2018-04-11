
class Human {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  birthday() {
    this.age++;
  }

  sayHello() {
    console.log(`Greetings!  My name is ${this.name}.  I am ${this.age} years old.`);
  }

  static funFact() {
    console.log("Humans are full of fun facts!");
  }

  _myPrivateMethod() {

  }
}

const thomas = new Human("Thomas", 30);
thomas.name = "Claire";
console.log(thomas);



