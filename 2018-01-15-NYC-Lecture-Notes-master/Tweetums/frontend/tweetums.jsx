import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');

  const currentUser = window.currentUser;
  // expecting currentUser to either be an object or undefined, depending on how it was set in app/views/static_pages/root
  let store;
  if (currentUser) {
    const { id, username } = currentUser;
    const preloadedState = {
      session: { id },
      users: { [id]: currentUser }
    };
    store = configureStore(preloadedState);
    window.currentUser = null;
  } else {
    store = configureStore();
  }


  ReactDOM.render(<Root store={store} />, root);
});
