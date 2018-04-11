function one() {
  console.log("one");
}

function two() {
  console.log("two");
}

function three() {
  console.log("three");
}

function four() {
  console.log("four");
}

// one();
// two();
// three();
// four();

// one();
// setTimeout(two, 1000);
// three();
// four();

one();
setTimeout(two, 1000);
setTimeout(three, 0);
four();
one();


  // Reader library to practice asynchronous functions

  // const readline = require('readline');
  //
  // const reader = readline.createInterface({
  //   input: process.stdin,
  //   output: process.stdout
  // });
  //
  // function youLikeJS() {
  //  reader.question("Do you like Javascript?\n");
  // }
  //
  // function yourAnswer(answer) {
  //   if (answer === "yes") {
  //     console.log("The Force is strong with you!");
  //     reader.close();
  //   } else {
  //     console.log("The Dark Side I sense in you.");
  //     reader.close();
  //   }
  // }
  //
  // const answer = youLikeJS();
  // yourAnswer(answer);
