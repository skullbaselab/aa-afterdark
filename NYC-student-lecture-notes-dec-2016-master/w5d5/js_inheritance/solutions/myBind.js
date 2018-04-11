// simple myBind with no args
Function.prototype.myBind = function (ctx) {
  return () => this.apply(ctx); 
};

// simple myBind with no args
Function.prototype.myBind = function (ctx) {
  return function () {
    return this.apply(ctx);
  }.bind(this);
};

Function.prototype.myBind = function (ctx) {
  const func = this;
  return function () {
    return func.apply(ctx);
  };
};

Function.prototype.myApply = function (ctx, arr) {
  this.bind(ctx)(...arr);
};

Function.prototype.myCall = function (ctx, ...args) {
  this.bind(ctx)(...args);
};

// cat.purr.myApply(meag, "loudly");

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
