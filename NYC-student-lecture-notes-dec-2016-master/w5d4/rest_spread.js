// ... in a function definition is the rest operator and puts all arguments into an array

// ARITY means how many arguments a funtion takes
// ARIDITY is dryness
const restfulFn = (length, ...args) => {
  args.forEach(console.log);
};

const spreadableFn = (arg1, arg2, arg3) => {
  console.log(arg1);
  console.log(arg2);
  console.log(arg3);
};

restfulFn(4, 2, 7, 3, 4);
myArgs = [3, 6, 9];

//  ... in a function call is the spread operator and spreads them apart as separate arguments
spreadableFn(...myArgs);
