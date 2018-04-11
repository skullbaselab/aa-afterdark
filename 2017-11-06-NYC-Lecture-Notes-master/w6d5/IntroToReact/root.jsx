import React from 'react';
import ReactDOM from 'react-dom';
import MattsApp from './components/app';

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<MattsApp />, root);
});



// banana='yellow'
// matt='hilarious'
// Any key-value pair can be passed down as props
