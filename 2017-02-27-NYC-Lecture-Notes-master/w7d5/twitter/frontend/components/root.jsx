import React from 'react';
import { Provider } from 'react-redux';
import { Router, Route, IndexRoute, hashHistory } from 'react-router';
import App from './app';
import Feed from './tweets/feed';
import configureStore from '../store/store';
import SignInForm from './auth/sign_in_form';
import SignUpForm from './auth/sign_up_form';

export default function Root() {
  const preloadedState = window.currentUser ?
    { session: { currentUser: window.currentUser, errors: {} } } :
    {};

  const store = configureStore(preloadedState);

  // any callback given to the onEnter prop will be given 3 args:
  // nextState, replace, and asyncDone
  function redirectUnlessLoggedIn(nextState, replace) {
    const loggedIn = store.getState().session.currentUser;
    // will be null (falsey) or an object (truthy)

    if (!loggedIn) {
      replace("/session/new");
    }
  }
  function redirectIfLoggedIn(nextState, replace) {
    const loggedIn = store.getState().session.currentUser;
    // will be null (falsey) or an object (truthy)

    if (loggedIn) {
      replace("/");
    }
  }

  return (
    <Provider store={ store }>
      <Router history={ hashHistory }>
        <Route path="/" component={ App }>
          <IndexRoute component={ Feed } onEnter={redirectUnlessLoggedIn} />
          <Route
            path="session/new"
            component={ SignInForm }
            onEnter={redirectIfLoggedIn}
            />
          <Route
            path="users/new"
            component={ SignUpForm }
            onEnter={redirectIfLoggedIn}
            />
        </Route>
      </Router>
    </Provider>
  );
}












// function isLoggedIn() {
//   return !!store.getState().session.currentUser;
// }
//
// function redirectIfLoggedIn(nextState, replace) {
//   if (isLoggedIn())
//     replace('/');
// }
//
// function redirectUnlessLoggedIn(nextState, replace) {
//   if (!isLoggedIn())
//     replace('/session/new');
// }
