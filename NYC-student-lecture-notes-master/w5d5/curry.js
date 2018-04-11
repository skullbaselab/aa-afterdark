const add = (a, b) => a + b;

const keepAdding = () => {
  const nums = [];

  return function _adding(num) {
    nums.push(num);
    console.log(`Sum is now: ${nums.reduce(add, 0)}`);
    return _adding;
  };
};

const curriedAdd = (a) => (b) => (c) => a + b + c;
