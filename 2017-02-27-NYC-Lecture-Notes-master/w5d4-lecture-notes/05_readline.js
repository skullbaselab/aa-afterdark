const readline = require('readline');
// readline library uses async to handle user inut

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question("What is your name?", function (answer) {
  console.log(`Hello ${answer}!`);
  reader.question("What is your favorite color?", function (answer) {
    console.log(`${answer} is a great color!`);
    reader.close();
  });
});
//prints question, then invokes callback when answer is received


// reader.close(); //immediately closes after asking question :(
