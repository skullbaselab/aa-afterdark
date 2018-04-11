
const Celebrity = function(name) {
  this.name = name;
};

const Dog = function(name) {
  this.name = name;
};

Dog.prototype.bark = function bark() {
  console.log(`Woof! - says ${this.name}`);
};

const fido = new Dog('Fido');
const jt = new Celebrity('JT');

fido.bark();
const jtBarks = Dog.prototype.bark.bind(jt); // returns a function
jtBarks();

fido.bark.apply(jt); // "Woof! - says JT"
Celebrity.prototype.speak = Dog.prototype.bark;
jt.speak();

function Foo(a) {

};

Foo.coolProperty = "Sup";

const f = new Foo("a");
f.soloFunc = function solo(params) {
  
}

f.coolProperty; // Undefined

const array = [];
array.push("someString");

array = {}; // Throw err

const num = 0;
num += 1;
