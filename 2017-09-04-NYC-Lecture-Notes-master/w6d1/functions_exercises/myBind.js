// simple myBind with no args
Function.prototype.myBind = function (ctx) {
  return () => {
    this.call(ctx);
  };

  // const myFunc = this;
  // return function() {
    // this.call(ctx);
    // - "this" is the window inside this function
    // thats why we save it to myFunc
    // myFunc.call(ctx);
  // };
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
