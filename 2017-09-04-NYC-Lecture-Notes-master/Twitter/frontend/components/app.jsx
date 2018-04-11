import React from "react";
import { Provider } from "react-redux";
import { HashRouter, Route, Switch } from 'react-router-dom';
import TweetIndex from "./tweet_index"
import LoginFormContainer from './login_form_container';
import SignupFormContainer from './signup_form_container';
import { ProtectedRoute, AuthRoute } from '../util/route_util';

const App = ({ store }) => {
  return (
    <main>
      <img className="hoot-logo" src={window.logoUrl} />
      <Switch>
        <AuthRoute exact path='/login' component={LoginFormContainer} />
        <Route exact path='/signup' component={SignupFormContainer} />

        <ProtectedRoute path='/' component={TweetIndex} />
      </Switch>
    </main>
  );
};

export default App;
