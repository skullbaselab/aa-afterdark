function sum(arg1, arg2, arg3) {
  return arg1 + arg2 + arg3;
}

const curryAdd = (arg1) => {
  return (arg2) => {
    return (arg3) => {
      return arg1 + arg2 + arg3;
    };
  };
};

// one-line fat arrow fuctions implicitly return whats to the right of the arrow
// might look cool, but can't debug bc cant put debuggers in implicit return statements
const badAdd = (arg1) => (arg2) => (arg3) => arg1 + arg2 + arg3;

const superAdd = (numArgs) => {
  const nums = [];
  const adder = (num) => {
    nums.push(num);
    console.log(nums);
    if (nums.length === numArgs) {
      return nums.reduce( (a, b) => {
        return a + b;
      });
    } else {
      return adder;
    }
  };
  return adder;
};