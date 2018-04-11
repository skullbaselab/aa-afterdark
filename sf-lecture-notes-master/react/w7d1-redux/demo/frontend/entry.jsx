import React from 'react';
import ReactDOM from 'react-dom';

import teamsReducer from './reducers/teams_reducer'; // v0
import configureStore from './store/configure_store'; // v1
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  const store = configureStore(); // v1
  ReactDOM.render(<Root store={store} />, root); // v1
  // ReactDOM.render(<Root />, root);

  window.store = store; // v1
});
