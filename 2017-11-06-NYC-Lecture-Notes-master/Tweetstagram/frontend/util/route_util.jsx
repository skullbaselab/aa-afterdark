import React from 'react';
import { withRouter, Route, Redirect } from 'react-router-dom';
import { connect } from 'react-redux';

// those spread props that we're passing to our Component in our Auth
// is special syntax from React
const Auth = ({component: Component, path, loggedIn}) => {
  // the below is the boring way to do the destructuring above
  // const Component = component;
  return (
    <Route path={path} render={(props) => {
        return !loggedIn ? (
          <Component {...props}/>
        ) : (
          <Redirect to="/"/>
        );
    }}/>
  );
};
const Protected = ({component: Component, path, loggedIn}) => {
  // the below is the boring way to do the destructuring above
  // const Component = component;
  return (
    <Route path={path} render={(props) => {
        return loggedIn ? (
          <Component {...props}/>
        ) : (
          <Redirect to="/signup"/>
        );
    }}/>
  );
};

const mapStateToProps = state => {
  return {
    loggedIn: Boolean(state.session.currentUser)
  };
};

// we need withRouter because if we didn't have it we would be exporting a connected component
// connected components rerender ONLY if their props change
// they don't just rerender all willy-nilly if their parent rerenders
// We wrap it withRouter to basically give the route props to our connect component so our
// connected component will recognize that its props have changed when we change the url
export const AuthRoute = withRouter(connect(mapStateToProps, null)(Auth));
export const ProtectedRoute = withRouter(connect(mapStateToProps, null)(Protected));

















"hey";
