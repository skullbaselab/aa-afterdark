const Circle = function (centerX, centerY, radius, color) {
  this.centerX = centerX;
  this.centerY = centerY;
  this.radius = radius;
  this.color = color;
};

Circle.prototype.move = function() {
  this.centerX++;
  this.centerY++;
};

Circle.prototype.render = function (ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.centerX,
    this.centerY,
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
};

function Demo(circle) {
  this.circle = circle;
}

Demo.prototype.render = function (ctx) {
  ctx.clearRect(0, 0, window.innerWidth, window.innerHeight);
  this.circle.render(ctx);
};

Demo.prototype.moveCircle = function () {
  this.circle.move();
};

Demo.prototype.start = function (canvasEl) {
  const ctx = canvasEl.getContext("2d");

  const animateCallback = () => {
    this.moveCircle();
    this.render(ctx);

    requestAnimationFrame(animateCallback);
    // setInterval(animateCallback, 1000/60);
  };

  animateCallback();
};

const canvasEl = document.getElementById("canvas");
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;
const myCircle = new Circle(10, 10, 50, '#0f0');

new Demo(myCircle).start(canvasEl);










// comment
