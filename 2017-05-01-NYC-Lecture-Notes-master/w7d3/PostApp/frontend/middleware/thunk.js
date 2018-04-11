// middleware receive actions before the reducers do
const thunk = ({ dispatch, getState }) => {
  return (next) => {
    return (action) => {
      // if the action that has been dispatched is a function,
      // invoke that function and pass in dispatch and getState
      if (typeof action === 'function') {
        return action(dispatch, getState); // invoke it, passing in dispatch/getState
      } // invoking it will halt the flow
      // if its just a regular object, just pass it along to the next middleware
      // in the chain.
      return next(action); // this actually passes it along (to next middleware or reducer)
    };
  };
};

// shorthand syntax:
// const thunk = store => next => action => {
// };

export default thunk;

// middleware signature, more info here:
// http://redux.js.org/docs/api/applyMiddleware.html
