import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import store from './store/store';
import { addFruit, clearAll } from './actions/fruitActions';
import { addBurger } from './actions/burgerActions';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  window.store = store;
  ReactDOM.render(<Root store={store} />, root);
});
