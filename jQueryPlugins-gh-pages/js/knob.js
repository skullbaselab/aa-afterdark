$.Knob = function (input) {
  this.$input = $(input);
  this.$input.css("display", "none");
  this.$input.val(0);

  this.$canvas = $('<canvas width="' + $.Knob.DIM + '"px" height="' + $.Knob.DIM + 'px"></canvas>');
  this.$canvas.insertBefore(this.$input);
  this.ctx = (this.$canvas)[0].getContext("2d");

  this.$canvas.on("mousedown", this.startDrag.bind(this));
  this.$input.on("change", this.drawVal.bind(this));

  this.drawVal();
};

$.Knob.DIM = 100;
$.Knob.INNER_AREA = 0.7;
$.Knob.INACTIVE_STYLE = "rgba(0,0,0,0.15)";
$.Knob.ACTIVE_STYLE = "rgba(0, 0, 255, 0.60)";

$.Knob.prototype.calcVal = function (event) {
  var centerX = this.$canvas.offset().left + ($.Knob.DIM / 2);
  var centerY = this.$canvas.offset().top + ($.Knob.DIM / 2);

  var dx = event.clientX - centerX;
  var dy = event.clientY - centerY;

  var norm = Math.sqrt((dx * dx) + (dy * dy));

  var angle = Math.acos(-dy / norm);
  if (dx < 0) {
    angle = (2 * Math.PI) - angle;
  }

  return angle / (2 * Math.PI);
};

$.Knob.prototype.changeVal = function (event) {
  this.$input.val(this.calcVal(event));
  this.$input.trigger("change");
};

$.Knob.prototype.drawVal = function () {
  this.ctx.clearRect(0, 0, $.Knob.DIM, $.Knob.DIM);

  var startAngle = -Math.PI / 2;
  var endAngle =
    (-Math.PI / 2) + 2 * Math.PI * parseFloat(this.$input.val());

  // draw initial grayed out zone
  this.ctx.fillStyle = $.Knob.INACTIVE_STYLE;
  this.ctx.beginPath();
  this.ctx.arc(
    $.Knob.DIM / 2,
    $.Knob.DIM / 2,
    $.Knob.DIM / 2,
    0,
    2 * Math.PI
  );
  this.ctx.fill();
  this.ctx.closePath();

  // draw selected area
  this.ctx.fillStyle = $.Knob.ACTIVE_STYLE;
  this.ctx.beginPath();
  this.ctx.lineTo(
    $.Knob.DIM / 2 + Math.cos(startAngle),
    $.Knob.DIM / 2 + Math.sin(startAngle)
  );
  this.ctx.arc(
    $.Knob.DIM / 2,
    $.Knob.DIM / 2,
    $.Knob.DIM / 2,
    startAngle,
    endAngle
  );
  this.ctx.lineTo($.Knob.DIM / 2, $.Knob.DIM / 2);
  this.ctx.closePath();
  this.ctx.fill();

  // clear out the middle
  this.ctx.fillStyle = "white";
  this.ctx.beginPath();
  this.ctx.arc(
    $.Knob.DIM / 2,
    $.Knob.DIM / 2,
    $.Knob.DIM / 2 * $.Knob.INNER_AREA,
    0,
    2 * Math.PI
  );
  this.ctx.fill();
  this.ctx.closePath();
};

$.Knob.prototype.startDrag = function (event) {
  event.preventDefault();

  var boundChangeVal = this.changeVal.bind(this);
  var $window = $(window);
  $window.on("mousemove", boundChangeVal);
  $window.on("mouseup", function (event) {
    $window.off("mousemove", boundChangeVal);
  });
};

$.fn.knob = function () {
  this.each(function () {
    new $.Knob(this);
  });
};

$(function () {
  $('input[type="knob"]').knob();

  $("form#robot").on("submit", function (event) {
    event.preventDefault();
    var payload = $(event.currentTarget).serializeJSON();
    alert(JSON.stringify(payload));
  });
});
