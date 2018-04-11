// `Call` and `Apply`

const dog = {
  name: "Topsy",
  age: 7
};

function dogWalkers(person1, person2, person3) {
  console.log(`${person1} takes ${this.name} for a walk.`);
  console.log(`${person2} takes ${this.name} for a walk.`);
  console.log(`${person3} takes ${this.name} for a walk.`);
}



const walkDogs = dogWalkers.bind(dog, "Casey", "Tracy", "Randy");
// walkDogs();

// dog.walk = walkDogs;

// dog.walk();

// arguments, thisArg
// obj.doSomething.bind(thisArg)

// dogWalkers("Casey", "Tracy", "Randy");
// dogWalkers.apply(dog, ["Casey", "Tracy", "Randy"]);

dogWalkers.call(dog, "Casey", "Tracy", "Randy");









// const nonWorkingDogWalkers = (person1, person2, person3) => {
//   console.log(`${person1} takes ${this.name} for a walk.`);
//   console.log(`${person2} takes ${this.name} for a walk.`);
//   console.log(`${person3} takes ${this.name} for a walk.`);
// };

// nonWorkingDogWalkers.call(dog, "Casey", "Tracy", "Randy");

