// Currying
function addThreeNumbers(one, two, three) {
  return one + two + three
}

function addThreeNumbersCurry(one) {
  return function (two) {
    return function (three) {
      return one + two + three;
    }
  }
}

const addThreeNumbersCurry = (one) => (two) => (three) => one + two + three;

addThreeNumbers(1, 2, 3);
addThreeNumbersCurry(1)(2)(3);
