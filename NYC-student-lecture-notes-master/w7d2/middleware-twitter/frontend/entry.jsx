import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('content');
  ReactDOM.render(<Root />, root);
});
