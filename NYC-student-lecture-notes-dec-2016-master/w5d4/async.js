/*eslint no-console: 0 */
/*eslint no-unused-vars: 0 */
/*eslint prefer-arrow-callback: 0 */
/*eslint func-names: 0 */

const timer = require('timers');
// let hello;
// // Ex 1
// const example = timer.setTimeout(function () {
//   hello = 'hello';
//   console.log('WHAAAA!');
//   // debugger
//   // this return is not going to do what we want
//   console.log(hello);
// }, 2000);
//
// console.log(example);
// console.log(hello);
// console.log('Yeah, I get it. Wait...');

// Ex 2
// let domo = 'domo';
// console.log(domo);
//
// timer.setTimeout(function () {
//   domo += ' domo1';
//   console.log(domo);
//
//   timer.setTimeout(function () {
//     domo += ' domo2';
//     console.log(domo);
//     // even with `0` microsecond delay it enters a queue...
//   }, 0);
//   console.log('not time for domo2 yet...');
// }, 0);

// callbacks eliminate ambiguity of timing

// domo += ' domo3';
// console.log(domo);
// loops are blocking, synchronous actions!
// for (let i = 0; i < 999999999; i++) {}
//
//
// wholeProgram();
// event queue runs

// Ex 3
const fs = require('fs');

let mobyStr;

const callback = (err, data) => {
  if (err) {
    console.log(err);
  } else {
    // mobyStr = data.toString();
    doMobyDickResearch(data);
    // console.log(mobyStr);
  }
};
// readFile is async,
//  it requires a callback to execute on completion
fs.readFile('moby_dick.txt', callback);
timer.setTimeout(() => console.log(mobyStr), 2);
