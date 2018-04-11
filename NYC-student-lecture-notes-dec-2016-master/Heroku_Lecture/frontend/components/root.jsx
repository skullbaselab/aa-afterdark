import React from 'react';
import { Provider } from 'react-redux';
import { Router, hashHistory, Route, IndexRedirect } from 'react-router';

import App from './app';
import TweetForm from './tweet_form';
import TweetIndex from './tweet_index';
import SessionFormContainer from './session_form/session_form_container';

export default function Root({ store }) {

  // TODO
  // make sure only logged-in users can see the tweet form
  // https://github.com/ReactTraining/react-router/blob/master/docs/API.md#onenternextstate-replace-callback
  // how can I check whether I am logged in?

  function ensureLoggedIn(_, replace) {
    const notLoggedIn = !store.getState().session.currentUser;

    if (notLoggedIn) {
      // replace is passed in from the onEnter hook
      replace('/signup');
    }
  }

  const routes = (
    <Route path="/" component={App}>
      <IndexRedirect to="tweets" />
      <Route path="signup" component={SessionFormContainer} />
      <Route path="tweets" component={TweetIndex} />
      <Route path="new" component={TweetForm} onEnter={ensureLoggedIn} />
    </Route>
  );

  return (
    <Provider store={store}>
      <Router history={hashHistory}>
        {routes}
      </Router>
    </Provider>
  );
}
