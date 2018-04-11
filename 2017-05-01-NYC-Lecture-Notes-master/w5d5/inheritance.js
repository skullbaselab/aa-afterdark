// // a constructor function is just a function
// // nothing special about it until we put the new in front of it
function Animal(title) {
  this.title = title;
  // alert("wubgabugauau");
}
//
// // WHAT DOES NEW DO FOR US
// // 1) IT MAKES AN EMPTY OBJECT AND WILL SET THE EMPTY OBJECT'S
// //     __proto__ PROPERTY TO THE PROTOTYPE OF THE CONSTRUCTOR
// // 2) THE CONTEXT (THIS) WILL REFER TO EMPTY OBJECT
// // 3) IT RETURNS AN OBJECT
//
// // ONLY FUNCTIONS HAVE PROTOTYPES
//
//
// function Dog(title, tail) {
//   Animal.call(this, title);
//   this.tail = tail;
// }
//
// // BAD. THIS LETS ANIMALS USE DOG METHODS WHICH IS BAD
// // Dog.prototype = Animal.prototype;
//
// // using constructor invokation to set the __proto__ of Dog.prototype
// // to Animal.prototype, therefore setting up the chain
// // Dog.prototype = new Animal();
// // function Surrogate() {}
// // Surrogate.prototype = Animal.prototype;
// // Dog.prototype = new Surrogate();
// Dog.prototype = Object.create(Animal.prototype);
//
// // setting the constructor is not integral to inheritance chain
// // Dog.prototype.constructor = Dog;
//
// // MAKE SURE YOU'RE DEFINING PROTOTYPE METHODS AFTER YOU SET UP INHERITANCE CHAIN
// Dog.prototype.wag = function () {
//   console.log(`${this.tail} be wagging`);
// };
//
// // exist is a property of the Animal.prototype object
// Animal.prototype.exist = function () {
//   console.log(`${this.title} is existing`);
// };

// THIS ES6 SYNTAX IS JUST SYNTATIC SUGAR but it does the same exact thing
// class Animal {
//   constructor(title) {
//     // these are called properties
//     this.title = title;
//   }
//
//   exist() {
//     console.log(`${this.title} is existing`);
//   }
// }
//
// class Dog extends Animal {
//   constructor(title, tail) {
//     super(title);
//     this.tail = tail;
//   }
//
//   wag() {
//     this.exist();
//     console.log(`${this.tail} be wagging`);
//   }
// }
// const annie = new Animal("cool animal");
// const ronald = new Dog("Ronnie", "muh tail");
