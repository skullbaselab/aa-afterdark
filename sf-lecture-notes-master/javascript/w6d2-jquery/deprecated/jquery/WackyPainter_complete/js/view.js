function View($el, painter) {
  this.$el = $el;
  this.painter = painter;

  this.setupEasel();
  this.bindEvents();
}

View.prototype.setupEasel = function () {
  var $addRow = $("<button>").html("Add a row").addClass("add-row");
  var $undo = $("<button>").html("Undo").addClass("undo");
  
  this.$el.append($undo);
  this.$el.append($addRow);
  // this.$el.append("Let's get wackier");
  for(var i = 0; i < 20; i ++) {
    this.addRow();
  }
};

View.prototype.addRow = function () {
  // var $row = $("<ul class='row group'></ul>")
  var rowIdx = this.$el.find(".row").length;
  var $row = $("<ul>").addClass("row").addClass("group");
  for(var colIdx = 0; colIdx < 20; colIdx++) {
    var $square = $("<li>").addClass("square").data("pos", [rowIdx, colIdx]);
    $row.append($square);
  }
  this.$el.append($row);
};

View.prototype.bindEvents = function () {
  this.$el.on("mousedown", ".square", this.brushDown.bind(this));
  this.$el.on("mouseup", ".square", this.brushUp.bind(this));
  this.$el.on("mouseenter", ".square", this.brushMove.bind(this));

  this.$el.find(".add-row").on("click", this.addRow.bind(this));
  this.$el.find(".undo").on("click", this.undoStroke.bind(this));
};

View.prototype.brushDown = function (e) {
  $("body").addClass("wacky");
  e.preventDefault();
  this.painter.startPainting();
  this.brushMove(e); //Added to make the first square I click on be painted
};

View.prototype.brushUp = function (e) {
  $("body").removeClass("wacky");
  e.preventDefault();
  this.painter.stopPainting();
};

View.prototype.brushMove = function (e) {
  e.preventDefault();
  if (this.painter.isPainting()) {
    var $square = $(e.currentTarget);
    var oldColor = $square.css("background-color");
    var pos = $square.data("pos");
    this.painter.paintSquare(pos, oldColor);
    var newColor = this.painter.currentColor();
    $square.css("background-color", newColor);
  }
};

View.prototype.undoStroke = function (e) {
  var oldSquares = this.painter.previousSquares();
  oldSquares.reverse().forEach(function (square) {
    var oldColor = square.oldColor;
    var pos = square.pos;
    var $row = this.$el.find(".row").eq(pos[0]);
    var $square = $row.find(".square").eq(pos[1]);
    $square.css("background-color", oldColor);
  }.bind(this));
};

module.exports = View;
