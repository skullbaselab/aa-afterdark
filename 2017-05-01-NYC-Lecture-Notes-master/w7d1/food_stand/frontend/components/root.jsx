import React from 'react';
import App from './app';
// Provider is a wrapper component.
// -> passes down the store to all components by working together with connect
import { Provider } from 'react-redux';

const Root = (props) => {
  return (
    <Provider store={props.store}>
      <App />
    </Provider>
  );
};

export default Root;
