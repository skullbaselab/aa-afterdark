var colors = ['darksalmon', 'cornflowerblue', 'red', 'yellow', 'wheat', 'hotpink', 'lawngreen'];

function Painter() {
  this.painting = false;
  this.brushStrokes = [];
}

Painter.prototype.startPainting = function () {
  this.painting = true;
  this.brushStrokes.push([]);
};

Painter.prototype.stopPainting = function () {
  this.painting = false;
}

Painter.prototype.currentColor = function () {
  var colorIdx = Math.floor(Math.random() * colors.length);
  return colors[colorIdx];
}

Painter.prototype.isPainting = function () {
  return this.painting;
}

Painter.prototype.paintSquare = function (pos, oldColor) {
  this.brushStrokes[this.brushStrokes.length - 1].push({pos: pos, oldColor: oldColor});
}

Painter.prototype.previousSquares = function () {
  if (!this.brushStrokes[0]) { return [] }

  return this.brushStrokes.pop();
};

module.exports = Painter;
