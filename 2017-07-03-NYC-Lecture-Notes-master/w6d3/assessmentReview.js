Function.prototype.myCall = function (context, ...args) {
  return this.apply(context, args);
  // both ways work
  // return this.bind(context)(...args);
};

Function.prototype.myApply = function(context, argsArray) {
  return this.bind(context)(...argsArray);
  // both ways work
  // return this.call(context, ...argsArray);
};

Function.prototype.curry = function (numArgs) {
  const args = [];
  const original = this;
  return function _curried(arg) {
    args.push(arg);
    if (numArgs === args.length) {
      return original(...args);
    } else {
      return _curried;
    }
  };
};

Function.prototype.fatCurry = function (numArgs) {
  const args = [];
  const _curried = (arg) => {
    args.push(arg);
    if (numArgs === args.length) {
      return this(...args);
    } else {
      return _curried;
    }
  };
  return _curried;
};
