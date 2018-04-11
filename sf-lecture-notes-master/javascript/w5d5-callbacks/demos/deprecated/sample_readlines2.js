var readline = require("readline");
var reader = readline.createInterface(process.stdin, process.stdout, null);

function sayColor (color) {
  console.log("Your favorite color is " + color);
}

reader.question("What is your favorite color?\n", sayColor);

