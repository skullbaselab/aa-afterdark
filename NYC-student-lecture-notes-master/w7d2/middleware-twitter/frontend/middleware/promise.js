function isPromise(object) {
  return typeof object.then === 'function';
}

export default function({ dispatch, getState }) {
  return (next) => (action) => {
    if (isPromise(action)) {
      return action.then(result => dispatch(result));
    }
    return next(action);
  };
}
