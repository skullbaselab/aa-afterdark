const thunk = store => next => action => {

  if (typeof action === 'function') {
    return action(store.dispatch, store.getState);
  } else {
    return next(action);
  }
};

export default thunk;

// middleware signature, more info here:
// http://redux.js.org/docs/api/applyMiddleware.html
