Function.prototype.myBind1 = function(ctx) {
  const that = this;
  // callbacks always get invoked function style, so need a way to carry over what "this" refers to
  return function() {
    that.call(ctx);
  };
};

Function.prototype.myBind2 = function(ctx) {
  // fat arrow funcs preserve "this" from the context where the func is being defined
  return () => {
    this.call(ctx);
  };
};

// accept arguments at both bind-time and call-time
Function.prototype.myBind3 = function(ctx, ...bindArgs) {
  return (...callArgs) => {
    const args = bindArgs.concat(callArgs);
    // call takes context as first args, and the rest of args 
    // this.call(ctx, ...args);
    // apply takes context as first arg, and array of args as second
    this.apply(ctx, args);
  };
};

function Dog(name) {
  this.name = name;
}

Dog.prototype.bark = function(action, message) {
  console.log(`${this.name} ${action} ${message}!`);
};

const copley = new Dog('Copley');
// const detachedBark= copley.bark;
const boundBark1 = copley.bark.myBind3(copley, 'says', 'woof');
const boundBark2 = copley.bark.myBind3(copley, 'says');
const boundBark3 = copley.bark.myBind3(copley);
// setTimeout(detachedBark, 1000);
// setTimeout(boundBark, 2000);
boundBark1();
boundBark2('meow');
boundBark3('sniffs', 'treats');
