const React = require("react");
const ReactDOM = require("react-dom");

const App = require("./components/App");

document.addEventListener("DOMContentLoaded", () => {
  const content = document.querySelector("#content");
  ReactDOM.render(<App />, content);
});
