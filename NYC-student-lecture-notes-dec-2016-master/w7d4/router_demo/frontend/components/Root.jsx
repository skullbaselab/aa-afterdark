import React from 'react';
import { Provider } from 'react-redux';
import {
  Router,
  hashHistory,
  Route,
  IndexRoute,
  IndexRedirect
} from 'react-router';

import store from '../store';
import App from './app';
import TweetIndex from './TweetIndex';
import TweetForm from './TweetForm';

// export default function Root() {
//   return (
//     <Provider store={ store }>
//       <App />
//     </Provider>
//   );
// }

export default function Root() {
  return (
    <Provider store={store}>
      <Router history={hashHistory}>
        <Route path="/" component={App}>
          <IndexRedirect to="tweets" />
          <Route path="tweets" component={TweetIndex} />
          <Route path="new" component={TweetForm} />
          <Route path="tweets/:id" component={TweetShow} />
        </Route>
      </Router>
    </Provider>
  );
}

// function redirectToTweetIndex(nextState, replace) {
//   replace('/tweets')
// }
// <IndexRoute component={TweetIndex} />
// <IndexRoute  onEnter={redirectToTweetIndex} />

function TweetShow(props) {
  return <div>{props.params.id}</div>
}
