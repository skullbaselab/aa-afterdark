# Currying
Explain what currying is in an generic way, the following is an extract from wikipedia.
```
In mathematics and computer science, currying is the technique of translating the evaluation of a function that takes multiple arguments (or a tuple of arguments) into evaluating a sequence of functions, each with a single argument.
```
Lets try an example with a function that receives 3 arguments and adds them up.

```js
Function.prototype.curry = function(nArg){
  const argArray = [];
  ...
};

function sum(a, b, c){
  return a + b + c;
}

const a = sum.curry(3); // sets the number of arguments and returns a function. argArray = []
const b = a(1); //sets the first element and returns a function. argArray = [1]
const c = b(2); //sets the second element and returns a function. argArray = [1, 2]
const res = c(3); //sets the third arg, finally we have all the required arguments to execute our sum function. argArray = [1, 2, 3]
```

If possible it is recommended to draw on the board how each execution is returning a function and keep track of the values of each variable especially the ones we _close_ over, sometimes students dont realize that we have access to certain variables inside of __*_curry()*__ thanks to closures, so be sure to explain that.

There are several ways of implementing currying, lets go over a few of them.

## Currying with arrow function
Make sure of explain why we have access to this (thanks to the arrow function);
```js
Function.prototype.curry = function(nArg){
  const argArray = [];
  const _curry = (arg) => {
    argArray.push(arg);
    if(argArray.length === nArg) {
      return this(...argArray); //spreading the array into individual arguments;
    } else {
      return _curry;
    }
  };
  return _curry;
};
```
## Currying with regular ES5 functions
Explain that in order to maintain the __this__ reference of we need to bind every curry() return, explain why we need to always bind the returning curry function.

```js
Function.prototype.curry = function (nArg) {
  const argArray = [];
  function _curry (arg) {
    argArray.push(arg);
    if (argArray.length === nArg) {
      return this(...argArray); //spreading the array into individual arguments;
    } else {
      return _curry.bind(this);
    }
  }
  return _curry.bind(this);
};
```
## Currying with regular ES5 functions closing over this
Give an alternative to the regular *'ol* bind, close over *__this__* with a new variable.

```js
Function.prototype.curry3 = function (nArg) {
  const argArray = [];
  const that = this; // creating a new variable to close over the value of this
  function _curry(arg) {
    argArray.push(arg);
    if (argArray.length === nArg) {
      return that(...argArray); //spreading the array into individual arguments;
    } else {
      return _curry; // no need to bind here as we are using the var that so the closure gives us access to the this context.
    }
  }
  return _curry;
};
```

In the end the concept of currying stays the same, but giving students different approaches, helps them understand the internal of how the actual curry function works.