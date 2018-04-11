function demo(arg1, arg2) {
  console.log(`Arguments is of type: ${arguments.constructor.name}`);
  const sliced = Array.prototype.slice.call(arguments);
  console.log(sliced);
  console.log(arguments);
  console.log(arguments[0]);

  const fromArray = Array.from(arguments);
  console.log(fromArray);
}


function restDemo(...arrayOfArgs) {
  console.log(arrayOfArgs);
}

// Shallow copy example
// firstArr = [[1],[2]];
// shallowCopy = firstArr.slice();
// shallowCopy[0][0] = 5;

demo("I am an argument", "Me too", "Third and little known arg");
restDemo("rest", "Is", "for", "the awesome!");