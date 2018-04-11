const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askNumQuestions(numTimes) {
  if (numTimes > 0) {
    reader.question("Enter a question:", function(answer) {
      const answers = ['Yes', 'No', 'Try again later'];
      const randomIndex = Math.floor(Math.random() * answers.length);

      console.log(answers[randomIndex]);

      askNumQuestions(numTimes - 1);
    });
  } else {
    console.log("goodbye");
    reader.close();
  }
}

askNumQuestions(3);
