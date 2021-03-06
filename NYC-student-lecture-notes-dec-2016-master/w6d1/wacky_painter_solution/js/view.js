/* jshint esversion: 6 */

// How many ways can I use the $ function?
// 1. w/ selector => returns array-like object with all elements that match selector
// 2. w/ html tag-looking string => create HTML element
// 3. w/ actual html node => wrap node w/ jQuery methods
// 4. w/ callback => call callback when document is loaded

function View($el) {
  this.$el = $el;
  this.setupEasel();
  $('#easel').on("mouseenter", '.square', (e) => {
    const $square = $(e.currentTarget);
    $square.css("background-color", window._randomColorString());
  });
}

window._randomColorString = function(){
  return '#' + Math.random().toString(16).substr(-6);
};

View.prototype.exercise0 = function () {
  $('li').removeClass("square");
};

View.prototype.exercise1 = function() {
  $("li").addClass("orange");
};

View.prototype.exercise2 = function() {
  $('.square').remove();
};

View.prototype.exercise3 = function() {
  const h1 = $("<h1>").text("I love jQuery");
  $("#easel").append(h1);
};

View.prototype.exercise4 = function() {
  $(".square:nth-child(even)").text("Jeff");
  //this could also be solved using iteration and %
};

View.prototype.exercise5 = function() {
  $('.square').on("click", e => {
    const $sq = $(e.currentTarget);
    alert($sq.attr("data-pos"));
  });
};

View.prototype.exercise6 = function() {
  $('.square').each( (idx, el) => {
    var $sq = $(el);
    $sq.css("background-color", _randomColorString());
  });
};

View.prototype.exercise7 = function() {
  $('#easel').on("mouseenter", ".square", e => {
    const $sq = $(e.currentTarget);
    console.log($sq.css("background-color"));
  });
};

View.prototype.setupEasel = function() {
  const $addRowButton = $('<button>').html('Add a row');
  this.$el.append($addRowButton);
  $addRowButton.on("click", this.addRow.bind(this));

  for(let j = 0; j <= 7; j++){
    const $button = $("<button>").html("Exercise " + j);
    $button.on("click", this["exercise" + j]);
    this.$el.append($button);
  }

  for(let i = 0; i < 20; i ++) {
    this.addRow();
  }
};

View.prototype.addRow = function() {
  const rowIdx = this.$el.find(".row").length;
  const $row = $("<ul>").addClass("row").addClass("group");
  for(let colIdx = 0; colIdx < 20; colIdx++) {
    const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);

    // What's wrong with this? How can we fix it?

    $row.append($square);
  }
  this.$el.append($row);
};

module.exports = View;
