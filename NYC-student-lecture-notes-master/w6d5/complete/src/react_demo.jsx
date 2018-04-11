const React = require('react');
const ReactDOM = require('react-dom');
const App = require('./app');

document.addEventListener("DOMContentLoaded", () => {
  const root = document.querySelector('#content');
  ReactDOM.render(<App />, root);
});
