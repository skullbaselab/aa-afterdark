import React from 'react';
import { Provider } from 'react-redux'; // v2
import App from './app';

const Root = ({ store }) => (
  <Provider store={store}>
    <App />
  </Provider> // v2
);

export default Root;
