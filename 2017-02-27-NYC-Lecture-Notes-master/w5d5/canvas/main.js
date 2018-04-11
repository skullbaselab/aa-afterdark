const Game = require('./game.js').game;
// const Hey = require('./game.js').otherThing;

document.addEventListener('DOMContentLoaded', () => {
  const canvasEl = document.getElementById("my-canvas");
  canvasEl.height = window.innerHeight;
  canvasEl.width = window.innerWidth;
  new Game(
    canvasEl.width,
    canvasEl.height
  ).start(canvasEl);
});
