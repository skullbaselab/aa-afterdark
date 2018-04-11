var readline = require('readline');
var reader = readline.createInterface(process.stdin, process.stdout, null);

reader.question("What is your name?", function (answer) {
  console.log("Hello " + answer + "!");
});

console.log("\n\nLast program line");
