import { renderFeedback } from './feedback';

// BUGGY VERSION
// Issue: Forgetting to explicitly return
// const getRandNum = () => {
//   Math.floor((Math.random() * 10) + 1);
// }

// CORRECT VERSION
const getRandNum = () => {
  return Math.floor((Math.random() * 10) + 1);
};

const getRandSymbol = () => {
  const randNum = Math.random();
  if (randNum < 0.33) {
    return "+";
  } else if (randNum >= 0.33 && randNum < 0.66) {
    return "-";
  } else {
    return "*";
  }
};

// BUGGY VERSION
// Issue #1: Forgetting to explicitly return
// Issue #2: Using fat arrow function in the wrong situation
// const mathProblem = {
//   firstNum: getRandNum(),
//   secondNum: getRandNum(),
//   operationSymbol: getRandSymbol(),
//   answer: () => {
//     eval(`${this.firstNum} ${this.operationSymbol} ${this.secondNum}`);
//   },
// };

// CORRECT VERSION
const mathProblem = {
  firstNum: getRandNum(),
  secondNum: getRandNum(),
  operationSymbol: getRandSymbol(),
  answer() {
    return eval(`${this.firstNum} ${this.operationSymbol} ${this.secondNum}`);
  },
};

// BUGGY VERSION
// Issue: If this executes here, there is no 'first-num' yet because it didn't
// execute within the document ready callback. Move this to inside the documentReady callback
// const firstDisplayNum = document.getElementById('first-num');
// firstDisplayNum.innerHTML = mathProblem.firstNum;
// const displaySymbol = document.getElementById('operation');
// displaySymbol.innerHTML = mathProblem.operationSymbol;
// const secondDisplayNum = document.getElementById('second-num');
// secondDisplayNum.innerHTML = mathProblem.secondNum;



// BUGGY VERSION
// Issue #1: Need to preventDefault to prevent page from reloading
// Issue #2: Comparison issue:
// userAnswer is a string; mathProblem.answer() returns an integer.
// const evaluateAnswer = (event) => {
//   const userAnswer = event.currentTarget.children[5].value;
//   renderFeedback(userAnswer === mathProblem.answer());
// }

// CORRECT VERSION
const evaluateAnswer = (event) => {
  event.preventDefault();
  const userAnswer = parseInt(event.currentTarget.children[5].value);

  // you could also just change the === to == instead of using parseInt
  renderFeedback(userAnswer === mathProblem.answer());
}


export { mathProblem, evaluateAnswer };
