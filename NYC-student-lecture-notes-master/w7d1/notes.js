// REDUX

// make a store
const store = createStore(reducer);

// we can get our state
store.getState();

// action is a POJO (plain old javascript object)
const action = {
  type: 'ACTION_TYPE',
  // we can include other information necessary for this action too
  // e.g.
  // id: 1
};

// we can dispatch actions
store.dispatch(action);

// we can subscribe (when the state changes, invoke this callback)
store.subscribe(callback);

// REACT-REDUX
// * container components: keep track of the redux state, solely concerned with behavior
// * presentational components: solely concerned with displaying props passed to it
