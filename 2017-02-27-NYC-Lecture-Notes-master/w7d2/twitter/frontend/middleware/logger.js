export default function ({ getState, dispatch}) {
  //destructure store object in function signature
  return (next) => (action) => {
    debugger
    console.log('%c Previous State:', 'color: green', getState());
    console.log('%c Action:', 'color: red', action);
    const result = next(action);
    console.log('%c Next State:', 'color: green', getState());
    return result;
  };
}
