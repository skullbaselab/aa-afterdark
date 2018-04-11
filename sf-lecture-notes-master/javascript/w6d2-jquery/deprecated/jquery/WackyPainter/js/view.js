function View($el) {
  this.$el = $el;
  this.setupEasel();
}

View.prototype.setupEasel = function () {
  for(var i = 0; i < 20; i++) {
    this.addRow();
  }
};

View.prototype.addRow = function () {
  var $row = $("<ul>").addClass("row").addClass("group");
  // var $row = $("<ul class='row group'></ul>")
  for(var colIdx = 0; colIdx < 20; colIdx++) {
    var $square = $("<li>").addClass("square");
    $row.append($square);
  }
  this.$el.append($row);
};

module.exports = View;
