import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store';

document.addEventListener("DOMContentLoaded", () => {

  // TODO
  // what if the currentUser were somehow magically available...
  // we could pass in some preloaded state when create the store
  // { session: { currentUser: ??? }}
  let preloadedState = {};
  if (window.currentUser) {
    preloadedState = { session: { currentUser: window.currentUser } };
  }

  const store = configureStore(preloadedState);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={ store } />, root);
});
