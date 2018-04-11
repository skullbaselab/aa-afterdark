const View = require('./ttt-view');
const Game = require('../../../ttt_node/solution/game');

// passing a callback into our $ function says "wait until the DOM"
// "is loaded then you can run this function"
$( () => {
  const rootEl = $('.ttt');
  const game = new Game();
  new View(game, rootEl);
});
