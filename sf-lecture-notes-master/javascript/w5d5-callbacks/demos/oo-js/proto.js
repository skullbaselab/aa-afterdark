
function Human(name, age) {
  this.name = name;
  this.age = age;
}

Human.prototype.birthday = function() {
  this.age++;
}

Human.prototype.sayHello = function() {
  console.log(`Greetings!  My name is ${this.name}.  I am ${this.age} years old.`);
}

Human.funFact = function() {
  console.log("Humans are full of fun facts!");
}

const thomas = new Human("Thomas", 30);
thomas.birthday();
thomas.sayHello();
Human.funFact();



