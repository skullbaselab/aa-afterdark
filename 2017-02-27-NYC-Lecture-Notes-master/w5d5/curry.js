// NB: CHALLENGE. WRITE A FUNCTION THAT ADDS THREE NUMBERS

function addThree (a, b, c) {
  return a + b + c;
}

// function addThreeCurry(a) {
//   return function (b) {
//     return function (c) {
//       return a + b + c;
//     };
//   };
// }

const addThreeCurry = (a) => (b) => (c) => a + b + c;

function keepAdding () {
  const nums = [];
  //use closure to capture nums
  const _adder = (num) => {
    nums.push(num);
    console.log(nums.reduce((accum, el) => accum + el));
    return _adder;
  };
  return _adder;
}

const summer = keepAdding();
const thing = summer(5);
