import React from 'react';
import {Provider} from 'react-redux';
import Root from './root';

export default () => (
  <Provider>
    <Root/>
  </Provider>
);