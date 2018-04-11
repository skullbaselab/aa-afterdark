// simple myBind with no args
Function.prototype.myBind = function (ctx) {
  return () => this.apply(ctx);
};

// myBind with arguments
// Function.prototype.myBind = function (ctx, ...bindArgs) {
//   return (...callArgs) => {
//     return this.apply(ctx, bindArgs.concat(callArgs));
//   };
// };

// `call` takes multiple args after the context
// `apply` takes a single array after the context (Apply Array)

Function.prototype.myBind = function (ctx) {
  const func = this;
  debugger
  return function () {
    debugger
    func.call(ctx);
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

const callback = curie.meow.myBind(curie);
debugger
setTimeout(callback, 1000);
debugger
