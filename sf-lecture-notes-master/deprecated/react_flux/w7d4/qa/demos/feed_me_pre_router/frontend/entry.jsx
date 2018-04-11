var React = require('react');
var ReactDOM = require('react-dom');

var App = require('./components/App');
var Order = require('./components/Order');
var Restaurant = require('./components/Restaurant');

document.addEventListener('DOMContentLoaded', function () {
  var content = document.querySelector('#content');
  ReactDOM.render(<App />, content);
});

