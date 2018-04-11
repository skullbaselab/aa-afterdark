const dog = {
  name: "Jim",
  age: 7
};

function dogWalker(p1, p2, p3) {
  console.log(`${p1} takes ${this.name} for a walk.`)
  console.log(`${p2} takes ${this.name} for a walk.`)
  console.log(`${p3} takes ${this.name} for a walk.`)
}

dogWalker.apply(dog, ["Dallas", "Kelly", "Tori"]);
dogWalker.call(dog, "Dallas", "Kelly", "Tori");

const boundDogWalker = dogWalker.bind(dog);
boundDogWalker("Dallas", "Kelly", "Tori");
