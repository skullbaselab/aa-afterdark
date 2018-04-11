import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const root = <Root store={ configureStore() }/>;
  ReactDOM.render(root, document.getElementById('react-container'));
});
