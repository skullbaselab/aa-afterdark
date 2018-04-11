const thunk = ({ dispatch, getState }) => {
  return (next) => {
    return (action) => {
      // if the action that has been dispatched is a function,
      // invoke that function and pass in dispatch and getState
      if (typeof action === 'function') {
        debugger
        return action(dispatch, getState);
      }
      debugger
      // if its just a regular object, just pass it along to the next middleware
      // in the chain.
      return next(action);
    };
  };
};

// shorthand syntax:
// const thunk = store => next => action => {
// };

export default thunk;

// middleware signature, more info here:
// http://redux.js.org/docs/api/applyMiddleware.html
