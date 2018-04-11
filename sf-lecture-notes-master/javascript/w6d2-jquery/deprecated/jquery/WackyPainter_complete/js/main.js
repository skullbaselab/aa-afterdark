/* globals $ */

var Painter = require("./painter");
var View = require("./view");

$(function () {
  var $easel = $("#easel");
  var painter = new Painter();
  new View($easel, painter);
});
