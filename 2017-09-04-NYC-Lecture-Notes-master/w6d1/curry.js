
// define a function to add three numbers:
function sum(arg1, arg2, arg3) {
  return arg1 + arg2 + arg3;
}

const curriedAdd = (arg1) => {
  return (arg2) => {
    return (arg3) => {
      return arg1 + arg2 + arg3;
    };
  };
};

const fancyAdd = arg1 => arg2 => arg3 => arg1 + arg2 + arg3;


const superAdd = (howManyNumbers) => {
  const nums = [];
  const _adder = (num) => {
    nums.push(num);
    console.log(nums);
    if (nums.length === howManyNumbers) {
      return nums.reduce((a, b) => a + b);
    }
    return _adder;
  };
  return _adder;
};









// comment
