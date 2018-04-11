// simple myBind with no args
Function.prototype.myBind = function (ctx) {
  const func = this;
  return function () {
     func.apply(ctx);
   };
  //returns a function that closes over the context
};

// myBind with arguments
// ???

class Cat {
  constructor(name) {
    this.name = name;
  }

  meow() {
    console.log(`${this.name} says meow!`);
  }
}

const curie = new Cat("Curie");
setTimeout(curie.meow.myBind(curie), 1000);
