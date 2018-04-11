const Game = require('./game.js');
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let g = new Game();
// works because named functions get hoisted
// g.run(reader, completion);

// in this case, only var declaration gets hoisted, not the whole def
const completion = function() {
// function completion() {
  reader.question('Play again? y or n: ', restartGame => {
    if (restartGame === 'y') {
      g = new Game();
      g.run(reader, completion);
    } else {
      reader.close();
    }
  });
};

g.run(reader, completion);

