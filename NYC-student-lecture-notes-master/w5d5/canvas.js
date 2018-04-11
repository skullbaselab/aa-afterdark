const Circle =  function (centerX, centerY, radius, color) {
  this.centerX = centerX;
  this.centerY = centerY;
  this.radius = radius;
  this.color = color;
};

Circle.prototype.move = function() {
  this.centerX += 10;
  this.centerY += 10;
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
  //this will empty the canvas
  ctx.clearRect(0, 0, window.innerWidth, window.innerHeight);
  this.circle.render(ctx);
};

Demo.prototype.moveCircle = function () {
  this.circle.move();
};

Demo.prototype.start = function (canvasEl) {
  // get a 2d canvas drawing context. The canvas API lets us call
  // a `getContext` method on a canvas DOM element.
  const ctx = canvasEl.getContext("2d");

  // this function will update the position
  // of the circle, clear it, and redraw
  const animateCallback = () => {
    this.moveCircle();
    this.render(ctx);
    // this will call our animateCallback again, but only when the browser
    // is ready, usually every 1/60th of a second
    requestAnimationFrame(animateCallback);

    // if we didn't know about requestAnimationFrame, we could use setTimeout
    // setTimeout(animateCallback, 1000/60);
  };

  // this will cause the first render and start the recursive loop
  animateCallback();
};

const canvasEl = document.querySelector("canvas");
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;
const myCircle = new Circle(10, 10, 100, '#f00');

new Demo(myCircle).start(canvasEl);
