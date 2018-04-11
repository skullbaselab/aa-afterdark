import React from 'react';
import TweetIndex from './tweet_index';
import TweetForm from './tweet_form';
import UserShow from './user_show';
import NavbarContainer from './navbar_container';
import SignUpFormContainer from './sign_up_form_container';
import { Route, Link, Switch } from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../util/route_util';

const App = () => {
  return (
    <div>
      <header>
        <h1>Tweetstagram</h1>
        <NavbarContainer />
      </header>
      <Switch>
        <AuthRoute path='/signup' component={SignUpFormContainer}/>
        <ProtectedRoute path='/tweets/new' component={TweetForm} />
        <Route path='/users/:id' component={UserShow} />
        <Route path='/' component={TweetIndex} />
      </Switch>
    </div>
  );
};

export default App;








"hey"
