const React = require('react');
const ReactDOM = require("react-dom");

const RecipesIndex = require('./recipes_index');

document.addEventListener("DOMContentLoaded", () => {
  const content = document.querySelector("#content");
  ReactDOM.render(<RecipesIndex />, content);
});
