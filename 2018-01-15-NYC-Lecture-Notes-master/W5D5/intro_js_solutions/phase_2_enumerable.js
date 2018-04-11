const NUMS = [1, 2, 3, 4, 5];

// Array#myEach
Array.prototype.myEach = function (func) {
  for (let i = 0; i < this.length; i++) {
    func(this[i]);
  }
};

NUMS.myEach((num) => {
  console.log(`square of ${num} is ${num * num}`);
});

// Array#.myMap
Array.prototype.myMap = function (func) {
  const mappedArray = [];

  this.myEach(element => mappedArray.push(func(element)) );

  return mappedArray;
};

// arrow function is an anonymous function
// multi line arrow functions allow for explicit returns and permit debuggers
const squarer =  (num) => {
  // debugger
  return num * num;
};

// function squarer (num) {
//   return num * num;
// }

// Simple arrow functions omit curly braces and have implicit return
console.log(NUMS.myMap( num => num * num ));

// Array#myInject
Array.prototype.myReduce = function (func, initialValue) {

  let arr = this;

  if (!initialValue) {
    initialValue = arr[0];
    arr = arr.slice(1);
  }

  let result = initialValue;

  arr.myEach(el => result = func(result, el));

  return result;
};

console.log(NUMS.myReduce( (total, item) => total + item ));
