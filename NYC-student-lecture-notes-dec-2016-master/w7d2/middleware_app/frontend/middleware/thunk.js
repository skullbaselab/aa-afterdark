export default function({ dispatch, getState }) {
  return (next) => (action) => {
    if (typeof action === 'function') {
      return action(dispatch, getState); // return promise
    }
    return next(action);
  };
}
