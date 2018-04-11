const React = require('react');
const ReactDOM = require('react-dom');

const RecipesIndex = require('./recipes_index');

document.addEventListener("DOMContentLoaded", () => {
  const root = document.querySelector("#root");
  ReactDOM.render(<RecipesIndex />, root);
});
