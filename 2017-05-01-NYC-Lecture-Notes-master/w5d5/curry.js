const add = (a, b) => a + b;

const curriedAdd = (a) => {
  return (b) => {
    // we've closed over a
    return a + b;
  };
};

const curriedAddd = a => b => a + b;
//  CURRYING IS THE IDEA OF TAKING IN ARGUMENTS AT DIFFERENT TIMES

const superAdd = (howManyNums) => {
  // where we will store numbers as we get them
  const nums = [];
  const _adder = (num) => {
    nums.push(num);
    if (nums.length === howManyNums) {
      return nums.reduce((a,b) => a + b);
    } else {
      return _adder;
    }
    // _adder function ends right here
    // when you invoke a function you don't just end up in other functions
  };
  // return value of the superAdd
  return _adder;
};
