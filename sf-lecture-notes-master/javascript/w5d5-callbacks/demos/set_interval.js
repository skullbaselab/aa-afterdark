const inTime = function inTime() {
  const timed = function timed() {
    console.log(1);
    console.log(2);
    setTimeout(function() {
      console.log(3);
    }, 0);
    console.log(4);
    debugger;
  }
  const notTimed = function notTimed() {
    console.log(5);
    console.log(6);
  }
  timed();
  notTimed();
}
const outOfTime = function outOfTime() {
  console.log(7);
  console.log(8);
}

inTime();
outOfTime();