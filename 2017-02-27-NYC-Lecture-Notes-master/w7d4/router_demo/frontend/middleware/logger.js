export default function({ getState, dispatch}) {
  return (next) => (action) => {
    console.log("%c Previous State:", 'color: green', getState());
    console.log("%c Action:", 'color: red', action);
    const result = next(action); // result will be the original action, next is dispatch function b/c logger is the last middleware
    console.log('%c Next State:', 'color: green', getState());
    return result;
  };
}
