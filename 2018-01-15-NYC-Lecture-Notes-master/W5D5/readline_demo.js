const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function times(callback, num = 1) {
  for(let i = 0; i < num; i++) {
    callback();
  }
}
// ASYNCHRONICITY

// Synchronous code will ALWAYS execute before asynchronous
function youLikeJS() {
  console.log('Hello');
  reader.question("Do you like JavaScript yet?\n", function(answer) {
    if (answer === "yes") {
      console.log("Wow that didn't take very long!");
    } else {
      console.log("I'm sure you'll love it soon!");
    }
    // If we want something to wait for the async to finish executing, it must
    // go inside the callback
    console.log('Thanks for answering. Goodbye!');
    reader.close();

  });
}

// youLikeJS();

function askEverybody(howMany) {
  reader.question("What's your name\n", function(yourName) {
    // Minus minus: syntax for decrementing
    howMany--;
    console.log(`Hello ${yourName}`);
    if (howMany > 0) {
      askEverybody(howMany);
    } else {
      reader.close();
    }
  });
}

askEverybody(3);
