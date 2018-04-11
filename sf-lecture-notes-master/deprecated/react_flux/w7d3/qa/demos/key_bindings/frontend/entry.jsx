const React = require("react"),
      ReactDOM = require("react-dom"),
      App = require("./components/app");

document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("root");
  ReactDOM.render(<App/>, container);
});
