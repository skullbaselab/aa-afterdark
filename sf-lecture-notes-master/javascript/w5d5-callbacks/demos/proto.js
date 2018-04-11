function ProtoHuman(name, age) {
  this.name = name;
  this.age = age;
}

ProtoHuman.prototype.birthday = function() {
  this.age++;
}

ProtoHuman.prototype.sayHello = function() {
  console.log(`Greetings!  My name is ${this.name}. 
  I am ${this.age} years old.`);
}

ProtoHuman.funFact = function() {
  console.log("ProtoHumans are full of fun facts!");
}

const protoThomas = new ProtoHuman("protoThomas", 30);
protoThomas.birthday();
protoThomas.sayHello();
ProtoHuman.funFact();
