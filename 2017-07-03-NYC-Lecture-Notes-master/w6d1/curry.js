// NB: WRITE A FUNCTION THAT ADDS THREE NUMBERS
function addNumbers (eggs, bacon, ham) {
  return eggs + bacon + ham;
}

// Currying!


function addThreeNumbers (num1) {
  return function(num2) {
    return function(num3) {
      return num1 + num2 + num3;
    };
  };
}

// CooOol ES6 syntax for the above 'addThreeNumbers'
const addUp = (a) => (b) => (c) => a + b + c;


function continousAdd() {
  let numers = 0;

  return function _insideAdd(number) {
    console.log(numers += number);
    return _insideAdd; // cool, just returning the function object
    // return _insideAdd(number); AAAAAAH Stack Overflow!
  };

}









// bottom
