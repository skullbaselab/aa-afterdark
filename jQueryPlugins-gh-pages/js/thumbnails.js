$.Thumbnails = function (el) {
  this.$el = $(el);

  this.$figureImage = this.$el.find("figure > img");
  this.$figureCaption = this.$el.find("figcaption");
  this.$navItems = this.$el.find("li");
  this.$buttonLeft = this.$el.find(".thumbnails-nav-left");
  this.$buttonRight = this.$el.find(".thumbnails-nav-right");

  this.navMax = 4;
  this.navIdx = 0;
  this.currentIdx = 0;

  this.activate(this.currentIdx);
  this.showNav();

  this.$el.on("click", "li", (function (event) {
    this.currentIdx = $(event.currentTarget).index();
    this.activate(this.currentIdx);
  }).bind(this));

  this.$el.on("mouseenter", "li", (function (event) {
    this.activate($(event.currentTarget).index());
  }).bind(this));

  this.$el.on("mouseleave", "li", (function (event) {
    this.activate(this.currentIdx);
  }).bind(this));

  this.$el.on("click", "button", (function (event) {
    var $button = $(event.currentTarget);
    var dir = $button.attr("data-dir");

    if (dir == "left" && (this.navIdx > 0)) {
      this.navIdx -= 1;
    } else if (dir == "right" &&
               ((this.navIdx + this.navMax) < this.$navItems.length)) {
      this.navIdx += 1;
    }
    this.showNav();
  }).bind(this));
};

$.Thumbnails.prototype.activate = function (idx) {
  var $li = this.$navItems.eq(idx);
  var $img = $li.find("img");

  if (this.currentIdx == idx) {
    this.$navItems.removeClass("is-current");
    $li.addClass("is-current");
  }

  this.$figureImage.attr("src", $img.attr("data-full-src"));
  this.$figureCaption.html($img.attr("alt"));
};

$.Thumbnails.prototype.showNav = function () {
  this.$navItems.removeClass("is-visible");
  this.showButtons();

  this.$navItems.each((function (idx, element) {
    if (idx < this.navIdx || idx >= this.navIdx + this.navMax) {
      return;
    }

    $(element).addClass("is-visible");
  }).bind(this));
};

$.Thumbnails.prototype.showButtons = function () {
    this.$buttonLeft.toggleClass("is-disabled", (this.navIdx == 0));
    this.$buttonRight.toggleClass("is-disabled", ((this.navIdx + this.navMax) >= this.$navItems.length));
}

$.fn.thumbnails = function () {
  return this.each(function () {
    new $.Thumbnails(this);
  });
};

$(function () {
  $(".thumbnails").thumbnails();
});