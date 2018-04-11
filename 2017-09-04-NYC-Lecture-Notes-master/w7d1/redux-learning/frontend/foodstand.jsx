import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import store from './store/store';
import { addFruit, clearFruit } from './actions/fruit_actions';
import { addBurger } from './actions/burger_actions';

document.addEventListener('DOMContentLoaded', () => {
  window.addBurger = addBurger;
  window.addFruit = addFruit;
  window.clearFruit = clearFruit;
  const root = document.getElementById('root');
  window.store = store;
  ReactDOM.render(<Root />, root);
});
