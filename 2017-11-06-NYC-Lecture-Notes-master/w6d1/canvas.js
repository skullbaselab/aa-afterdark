// TODO, make circle, move circle, use OOP

function Circle (centerX, centerY, radius, color) {
  this.centerX = centerX;
  this.centerY = centerY;
  this.radius = radius;
  this.color = color;
}

Circle.prototype.render = function (ctx) {
  ctx.beginPath();
  ctx.arc(this.centerX, this.centerY, this.radius, 0, 2 * Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
};

Circle.prototype.move = function() {
  this.centerX ++;
  this.centerY++;
};

function Game(circle) {
  this.circle = circle;
}

Game.prototype.render = function (ctx) {
  ctx.clearRect(0, 0, window.innerWidth, window.innerHeight);
  this.circle.render(ctx);
};

Game.prototype.move = function() {
  this.circle.move();
};

Game.prototype.start = function(canvas) {
  const ctx = canvas.getContext('2d');
  const animateCallback = () => {
    this.move();
    this.render(ctx);
    requestAnimationFrame(animateCallback);
  };
  requestAnimationFrame(animateCallback);
  // setInterval(() => {
  //   this.move();
  //   this.render(ctx);
  // }, 1000 / 60);
};

const circle = new Circle(100, 100, 20, 'cadetblue');
const canvasEl = document.getElementById('canvas');
const game = new Game(circle);
game.start(canvasEl);
