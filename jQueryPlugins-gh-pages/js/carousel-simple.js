//   CAROUSEL
//   ========
//
//      <figure>
//   +------------+
//   | +--------+-|------+--------+
//   | |  <li>  | | <li> |  <li>  |  <ul>
//   | +--------+-|------+--------+
//   +------------+
//
//   The outer <figure> tag acts as a viewport,
//   constraining its visible content with a
//   width, hiding the overflow. Inside of it is
//   a <ul> tag. This <ul> contains all the <li>
//   slides, which are floated next to each
//   other in one long strip. The whole <ul> is
//   then moved left and right, only exposing
//   the desired part (one single <li>) as part
//   of the <ul>.


$.Carousel = function (el) {
  this.$el = $(el);
  this.$items = this.$el.find("li");
  this.$container = this.$el.find("ul");
  this.activeIdx = 0;

  this.$container.css("width", (this.$items.length * 100) + "%");

  this.$el.on("click", "button", this.clickButton.bind(this));
};

$.Carousel.prototype.clickButton = function (event) {
  var dir = parseInt($(event.currentTarget).attr("data-dir"));
  var newIdx = (this.activeIdx + dir + this.$items.length) % this.$items.length;

  this.slideTo(newIdx);
};

$.Carousel.prototype.slideTo = function (newIdx) {
  this.activeIdx = newIdx
  this.$container.css("left", (this.activeIdx * -100) + "%");
}

$.fn.carousel = function () {
  return this.each(function () {
    new $.Carousel(this);
  });
};

$(function () {
  $(".carousel").carousel();
});
