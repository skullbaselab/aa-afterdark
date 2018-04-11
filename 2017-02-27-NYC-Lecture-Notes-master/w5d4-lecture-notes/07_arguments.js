//
// function summer() {
//   let sum = 0;
//   //we can access `arguments`, which is array-like
//   const argsArray = Array.from(arguments);
//   argsArray.forEach((el) => { sum += el; });
//   return sum;
// }

function summer(...numbers) {
  //`...` is called the rest operator, stores arbitrary num of arguments in array
  let sum = 0;
  numbers.forEach((num) => { sum += num; });
  return sum;
}

function multiplyFirstTwoThenAdd(first, second, ...numbers) {
  let product = first * second;
  numbers.forEach((num) => { product += num; });
  return product;
}
