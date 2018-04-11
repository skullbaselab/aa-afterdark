// const sum = () => {
//   return 3 + 2;
// };

// sum();


//  POJO

// const cat = {
//   name: "Breakfast",
//   age: 8,
//   ageOneYear() {
//     this.age += 1;
//   },
//   favoriteFoood: "food"
// };

// returns a POJO

// function catCreator(name, age) {
  // return {
  //   name: name,
  //   age: age,
  //   ageOneYear() {
  //     this.age += 1;
  //   }
//   };
// }


// constructor function: called by new keyword


function Cat(name, age) {
  this.name = name;
  this.age = age;
}

Cat.prototype.ageOneYear = function() {
  this.age += 1;
}

// Cat.generateAge = () => (Math.random() * 10);

// add ageOneYear and purr on Cat.prototype


// const Jefferson = new Cat("Jefferson", 10);
// Tiger.__proto__ === Cat.prototype ?


function eatFood() {

}

const eatFood = function() {};

const eatFood = () => {};

const eatFood = function eatFood() {

};



// where is this stored?
// Cat.generateAge();
