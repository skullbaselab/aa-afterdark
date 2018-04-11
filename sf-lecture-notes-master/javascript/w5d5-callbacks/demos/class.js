class ClassHuman {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
  birthday() {
    this.age++;
  }
  greeting() {
    console.log(`My name is ${this.name}`);
    console.log(`My age is ${this.age}`);
  }
  static funFact() {
    console.log('ClassHumans are also fun!');
  }

}

ClassHuman.option = "option";
ClassHuman.option; // "option"

ClassHuman.prototype.yell = function(word) {
  console.log(`${this.name} yells "${word}"!`);
}

const classThomas = new ClassHuman("ClassThomas", 30);
classThomas.birthday();
classThomas.greeting();
classThomas.yell('Obscenities');


