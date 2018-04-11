const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// misleading : 'summation' below is not yet set to anything when line 22 executes
// let summation;

// async function :)
// executes function and continues to execute the rest of the file.
// Waits to execute cb until receiving the necessary input
rl.question('Whats the first number? ', (answer1) => {
  console.log(`Thank you for your valuable first number feedback: ${answer1}`);
});





// console.log(summation);

// console.log(answer);
