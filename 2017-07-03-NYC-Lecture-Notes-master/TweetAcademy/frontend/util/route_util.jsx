import { Route, withRouter, Redirect } from 'react-router-dom';
import React from 'react';
import { connect } from 'react-redux';

// only shows component if no one's logged in, else redirects to index
const Auth = ({ component: Component, path, loggedIn }) => {
  return (
    <Route
      path={ path }
      render={ props => !loggedIn ? <Component { ...props } /> : <Redirect to="/" /> }
    />
  );
    // ^ render takes a callback that will be invoked
    //   when the path matches, with router props as an argument
};

// only shows component if someone's logged in, else redirect to login form
const Protected = ({ component: Component, path, loggedIn }) => {
  return (
    <Route
      path={ path }
      render={ props => loggedIn ? <Component { ...props } /> : <Redirect to="/login" />}
    />
  );
};

const mapStateToProps = ({ session }) => {
  return {
    loggedIn: Boolean(session.currentUser),
                      // ^ currentUser will be object or null
  };
};

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth));
export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected));
