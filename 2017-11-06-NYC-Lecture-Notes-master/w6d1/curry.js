
// define a function to add three numbers:
function sum(arg1, arg2, arg3) {
  return arg1 + arg2 + arg3;
}
// function that returns another function so you can chain on invocations
// now do it with currying:

function sum(arg1) {
  return function(arg2) {
    return function(arg3) {
      return arg1 + arg2 + arg3;
    };
  };
}

const fatArrowSum = arg1 => arg2 => arg3 => arg1 + arg2 + arg3;

function adder(totalNumbers) {
  const allNumbers = [];
  return function adderHelper(number) {
    allNumbers.push(number);
    if (allNumbers.length >= totalNumbers) {
      return allNumbers.reduce((el, acc) => el + acc, 0);
    } else {
      return adderHelper;
    }
  };
}
