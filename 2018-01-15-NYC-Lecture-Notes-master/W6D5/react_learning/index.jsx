import React from 'react';
import ReactDOM from 'react-dom';
import App from './app.jsx';


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const blah = 'really kewl';
  const takeBrian = (brain) => {
    return `Really really ${brain}`;
  };
  // JSX tags around the component inform ReactDOM.render that this is a component
  ReactDOM.render( <App maurice='super awesome' brianFunc={ takeBrian }/>, root );
});
