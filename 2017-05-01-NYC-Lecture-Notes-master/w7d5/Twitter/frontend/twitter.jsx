import React from 'react';
import ReactDom from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import { merge } from 'lodash';

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  let store;
  if (window.currentUser) {
    store = configureStore({ session: { currentUser } });
    delete window.currentUser;
  } else {
    store = configureStore();
  }


  // window.merge = merge;
  ReactDom.render(<Root store={store}/>, rootEl);
});
