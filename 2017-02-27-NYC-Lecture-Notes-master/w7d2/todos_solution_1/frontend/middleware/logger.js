export default function (store) {
  return (next) => (action) => {
    //applyMiddleware expects this function signature
    const { getState } = store;
    debugger
    console.log('%c Previous State:', 'color: green', getState());
    console.log('%c Action:', 'color: red', action);
    const result = next(action);
    console.log('%c Next State:', 'color: green', getState());
    return result;
  };
}
