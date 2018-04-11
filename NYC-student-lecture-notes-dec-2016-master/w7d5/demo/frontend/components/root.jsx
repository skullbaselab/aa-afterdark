import React from 'react';
import { Provider } from 'react-redux';
import { Router, Route, IndexRoute, hashHistory } from 'react-router';
import { getCurrentUser } from '../actions/session_actions';
import App from './app';
import Feed from './feed';
import configureStore from '../store';
import SignInForm from './sign_in_form';
import SignUpForm from './sign_up_form';

export default function Root() {
  const preloadedState = window.currentUser ?
    { session: { currentUser: window.currentUser, errors: {} } } :
    {};

  delete window.currentUser;
  const store = configureStore(preloadedState);
  // const store = configureStore();
  let fetched = false;

  // function fetchCurrentUser(nextState, replace, asyncDone) {
  //   // asyncDone();
  //   if (!fetched) {
  //     fetched = true;
  //     store.dispatch(getCurrentUser()).then(() => asyncDone());
  //   }
  // }

  function isLoggedIn() {
    return !!store.getState().session.currentUser;
  }

  function redirectIfLoggedIn(nextState, replace) {
    if (isLoggedIn())
      replace('/');
  }

  function redirectUnlessLoggedIn(nextState, replace) {
    if (!isLoggedIn())
      replace('/session/new');
  }

  function simulateLatency(nextState, replace, next) {
    setTimeout(() => {
      console.log('finished');
      next();
    }, 1000);
  }

  return (
    <Provider store={ store }>
      <Router history={ hashHistory }>
        <Route path="/" component={ App } onEnter={ simulateLatency }>
          <IndexRoute component={ Feed } onEnter={ redirectUnlessLoggedIn }/>
          <Route
            path="session/new"
            component={ SignInForm }
            onEnter={ redirectIfLoggedIn }
            />
          <Route
            path="users/new"
            component={ SignUpForm }
            onEnter={ redirectIfLoggedIn }
            />
        </Route>
      </Router>
    </Provider>
  );
}
