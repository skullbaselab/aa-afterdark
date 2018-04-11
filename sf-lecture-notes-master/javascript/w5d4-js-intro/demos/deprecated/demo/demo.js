var randomFactory = function() {
  var randomNum = 0;

  var getNum = function() {
    return randomNum;
  };

  var getNewNum = function() {
    randomNum = Math.random();
    return randomNum;
  };

  return {
    getNewNum: getNewNum,
    getNum: getNum
  };
};

var randomMaker = randomFactory();

console.log(randomMaker.getNum());
console.log(randomMaker.getNewNum());
console.log(randomMaker.getNum());
