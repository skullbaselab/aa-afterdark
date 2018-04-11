import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter } from 'react-router-dom';
// import {
//   Router,
//   hashHistory,
//   Route,
//   IndexRoute,
//   IndexRedirect
// } from 'react-router';

import store from '../store';
import App from './app';
// import TweetIndex from './TweetIndex';
// import TweetForm from './TweetForm';
// import Tweet from './Tweet';

export default function Root() {
  return (
    <Provider store={ store }>
      <HashRouter>
        <App />
      </HashRouter>
    </Provider>
  );
}
