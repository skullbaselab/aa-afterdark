thing();
// coolFunction();

const NUMS = [1, 2, 3, 4, 5];

// Array#myEach
Array.prototype.myEach = function (eachCallback) {
  for (let i = 0; i < this.length; i++) {
    eachCallback(this[i]);
  }
};

NUMS.myEach((num) => {
  console.log(`square of ${num} is ${num * num}`);
});

// Array#.myMap
Array.prototype.myMap = function (mapCallback) {
  const mappedArray = [];

  const coolFunction = function (element) {
    mappedArray.push(mapCallback(element));
  };

  this.myEach(coolFunction);

  return mappedArray;
};

const coolFunction = function (num) {
  return num * num;
};

function thing() {
  console.log("thing");
}

console.log(NUMS.myMap(coolFunction));

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
