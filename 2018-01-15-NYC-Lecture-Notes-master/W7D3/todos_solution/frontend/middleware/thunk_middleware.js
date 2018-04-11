const thunkMiddleware = ({ dispatch, getState }) => next => action => {
  debugger
  if (typeof action === 'function') {
    debugger
    return action(dispatch);
  }
  debugger
  return next(action);
};

export default thunkMiddleware;
