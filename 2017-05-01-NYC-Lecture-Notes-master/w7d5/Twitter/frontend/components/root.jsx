import React from 'react';
import {Provider} from 'react-redux';
import TweetIndex from './tweet_index';
import TweetForm from './tweet_form';
import SessionForm from './session_form';
import Header from './header';
import { Route, HashRouter } from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../util/route_util';


const Root = ({store}) => {
  return (
    <Provider store={store}>
      <HashRouter>
        <section>
          <Header/>
          <Route exact path="/" component={TweetIndex} />
          <ProtectedRoute path="/maketweet" component={TweetForm}/>
          <AuthRoute path="/login" component={SessionForm}/>
          <AuthRoute path="/signup" component={SessionForm}/>
        </section>
      </HashRouter>
    </Provider>
  )
}

export default Root
