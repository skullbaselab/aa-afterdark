
const thing = [1, 2, 3];

// thing.forEach(num => console.log(num));

// const logNum = num => console.log(num);
// thing.forEach(logNum);

function logNum(num) {
  console.log(num);
} 

thing.forEach(logNum);
