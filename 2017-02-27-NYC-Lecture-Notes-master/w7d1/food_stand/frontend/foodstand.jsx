import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import store from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  window.store = store;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
