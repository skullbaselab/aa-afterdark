// simple myBind with no args
// inside of myBind, "this" is the function you want to bind
// but the goal of myBind is to make sure the returned function is bound to
// the argument you pass it (ctx), no matter where/how you invoke it


Function.prototype.myBind = function (ctx) {
  // fat arrow will make sure "this" is whatever "this" was when
  // the function was defined
  return () => {
    return this.call(ctx);
  };

  // const myFunc = this;
  // return function() {
    // this.call(ctx);
    // - "this" is the window inside this function
    // thats why we save it to myFunc
    // myFunc.call(ctx);
  // };
};

Function.prototype.myBind = function (ctx) {
  const originalFunction = this;
  return function () {
    // we'll have any variables defined in outer scope above,
    // but have to bind "this"
    return originalFunction.call(ctx);
  };
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
