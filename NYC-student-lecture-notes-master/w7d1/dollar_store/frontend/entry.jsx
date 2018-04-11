import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './widget';
import store from './store';

document.addEventListener("DOMContentLoaded", function(){
  window.store = store;
  ReactDOM.render(<Widget store={store}/>, document.getElementById('root'));
});
