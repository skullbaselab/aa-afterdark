const readline = require('readline');

// it's okay if this part is magic; it just says that we want to
// 1. output the prompt to the standard output (console)
// 2. read input from the standard input (again, console)
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const b = () => {
  reader.question("How old are you?", function (answer) {
    console.log(`I am also ${answer}!`);
    reader.close();
  });
};

reader.question("What is your name?", function (answer) {
  console.log(`Hello ${answer}!`);
  b();
  // reader.close();
});

console.log("Last program line");
