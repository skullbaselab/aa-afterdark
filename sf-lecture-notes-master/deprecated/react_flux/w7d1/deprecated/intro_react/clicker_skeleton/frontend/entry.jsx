var React = require('react'),
    ReactDOM = require('react-dom'),
    ClickCounter = require('./clickCounter');

document.addEventListener('DOMContentLoaded', function(){
  ReactDOM.render(
    React.createElement(ClickCounter, {}),
    document.getElementById('root')
  );
}, false);
