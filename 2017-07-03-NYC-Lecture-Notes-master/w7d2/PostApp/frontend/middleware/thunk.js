const thunk = ({dispatch, getState}) => next => action => {

  // if action is a function, stop! invoke action with these arguments
  if ( typeof action === 'function' ){
    debugger
    return action(dispatch, getState);
  }

  // if not, invoke next with our non-function action
  // Note: The last middleware in the chain will always
  // be the reducer due to how applyMiddleware sets up
  // our chain.
  debugger
  return next(action);
};

export default thunk;

// middleware signature, more info here:
// http://redux.js.org/docs/api/applyMiddleware.html
