import React from 'react';
import PostIndexContainer from './postIndexContainer';
import { Provider } from 'react-redux';
import store from '../store/store';

const Root = () => {
  return (
    <Provider store={store}>
      <div>
        <h1>ALL THE POSTS!</h1>
        <PostIndexContainer />
      </div>
    </Provider>
  );
};

export default Root;
