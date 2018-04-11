// Example 1

// pre-defined function
const logGreeting = () => console.log("greetings from inside a callback");
setTimeout(logGreeting, 2000);

// argument-defined function
setTimeout(() => {
  console.log("greetings, Arrow");
}, 2000);







// Example 2

const timesTwo = num => num * 2;
const doubledArr1 = [1,2,3].map(timesTwo);
console.log(doubledArr1);

const doubledArr2 = [1,2,3].map(num => num * 2);
console.log(doubledArr2);

// ruby equiv: [1,2,3,4,5].map { |num| num * 2 }



// Example 3 (Never use var!!!)
const loggerWithLet = function logger() {
  for (let i = 0; i < 3; i++) {
    setTimeout(() => console.log(i), 1000);
  }
}

const loggerWithVar = function logger() {
  for (var i = 0; i < 3; i++) {
    setTimeout(() => console.log(i), 1000);
  }
}
