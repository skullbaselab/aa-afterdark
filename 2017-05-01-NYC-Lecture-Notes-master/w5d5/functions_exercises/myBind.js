// simple myBind with no args
Function.prototype.myBind = function (ctx) {
  const myFunc = this;
  return function() {
    myFunc.call(ctx);
    // invoke function we originally called bind on
  };
  // cheating because fat arrows are sort of binding anyway
  // fat arrows automatically bind to the context in which they were defined
  // return () => this.apply(ctx);
};


class Cat {
  constructor(name) {
    this.name = name;
  }

  meow() {
    console.log(`${this.name} says meow!`);
  }
}

const curie = new Cat("Curie");
const detachedMeow = curie.meow;
const boundMeow = detachedMeow.myBind(curie);
setTimeout(boundMeow, 1000);
