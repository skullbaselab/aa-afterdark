const NUMS = [1, 2, 3, 4, 5];

// Array#myEach
Array.prototype.myEach = function (myEachCb) {
  for (let i = 0; i < this.length; i++) {
    myEachCb(this[i]);
  }
};

NUMS.myEach((num) => {
  // console.log(`square of ${num} is ${num * num}`);
});

// Array#.myMap
Array.prototype.myMap = function (myMapCb) {
  const mappedArray = [];

  // this.myEach(element => mappedArray.push(myMapCb(element)) );
  this.myEach( function (el) {
    const mappedEl = myMapCb(el);
    mappedArray.push(mappedEl);
   } );

  return mappedArray;
};

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

// console.log(NUMS.myReduce( (total, item) => total + item ));
