import React from 'react';
import ReactDOM from 'react-dom';
import App from './src/app';

document.addEventListener('DOMContentLoaded', () => {
  // we need to grab an HTML Element to put all our React
  // elements into
  const root = document.getElementById('root');

  // App is a JS function, but using this
  // HTML-like syntax (JSX) actually calls
  // React.createElement on the function
  ReactDOM.render(<App greeting="Sup!!!" />, root);
});
