import React from 'react';
import { Provider } from 'react-redux';
import {
  Router,
  hashHistory,
  IndexRoute,
  IndexRedirect,
  Route
} from 'react-router';

import store from '../store';
import App from './app';
import TweetIndex from './TweetIndex';
import TweetForm from './TweetForm';
import Tweet from './Tweet';

export default function Root() {
  return (
    <Provider store={ store }>
      <Router history={ hashHistory }>
        <Route path='/' component={ App } onEnter={ redirectIfNotLoggedIn }>
          <IndexRedirect to='/tweets' />
          <Route path='tweets' component={ TweetIndex } />
          <Route path='new' component={ TweetForm } />
          <Route path='tweets/:id' component={ Tweet } />
        </Route>
      </Router>
    </Provider>
  );
  // <IndexRedirect to="tweets" />
}

// function fetchTweet (nextState, replace, asyncDoneCallback) {
//   //avoid fetching in onEnter hook because now component is tightly coupled to the route
//   store.dispatch(fetchTweet(nextState.params.id)).then(asyncDoneCallback);
// }

function redirectIfNotLoggedIn (nextState, replace, asyncDoneCallback) {
  //the third argument is always the asyncDoneCallback
  //if there are 3 or more args, nothing will happen until the asyncDoneCallback is invoked
  if (Math.random() > 0.5) {
    replace('/tweets');
  }

  asyncDoneCallback();
}
