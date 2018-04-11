function sum1() {
  let total = 0;
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }

  return total;
}

function sum2(...nums) {
  let total = 0;
  for (let i = 0; i < nums.length; i++) {
    total += nums[i];
  }

  return total;
}

Function.prototype.myBind1 = function (ctx) {
  const fn = this;
  const bindArgs = Array.from(arguments).slice(1);
  return function () {
    // new scope: new this and new arguments object
    const callArgs = Array.from(arguments);
    return fn.apply(ctx, bindArgs.concat(callArgs));
  };
};

Function.prototype.myBind2 = (ctx, ...bindArgs) => {
  // this will be the global scope, not the function that myBind is called on, as we would expect
  // ^^ NOT recommended here b/c we want to call the function method-style
  return (...callArgs) => {
    // this = this from outside scope
    // no new arguments object
    // return () => {
    //   // this = this from outside scope = this from outside-outside scope
    // };
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
};

function curriedSum(numArgs) {
  var numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      let total = 0;

      numbers.forEach((n) => { total += n; });

      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

// using spread
Function.prototype.curry = function (numArgs) {
  const args = [];
  const fn = this;

  function _curriedFn(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return fn(...args);
    } else {
      return _curriedFn;
    }
  }

  return _curriedFn;
};

// using apply
Function.prototype.curry1 = function(numArgs){
  const args = [];
  let fn = this;
  function _curried(arg){
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return _curried;
    }
  }
  return _curried;
};
