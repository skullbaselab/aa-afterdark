// Store
// just an object with keys pointing to some functions

function createStore(reducer) { //create Store will take only one reducer
  let state;
  let listeners = [];
  return {
    getState: () => {
      return state;
    },
    dispatch: (action) => {
      // completely reassigning state so we have a record of the changes that have been made to state
      state = reducer(state, action);
      listeners.forEach((callback) => callback());
    },
    subscribe: (callback) => {
      listeners.push(callback);
      // return functionThatRemovesThisCallbackFromListeners;
    }
  };
}

// Reducer
// state will often be an object but can be anything
function counter(state = {number: 0}, action) {
  // if (action.type === "increment") {
  //   return state + 1;
  // } else if (action.type === "decrement") {
  //   return state - 1;
  // } else {
  //   return state;
  // }
  // below equivalent to above
  let newState;
  switch (action.type) {
    case "increment":
    newState = Object.assign({}, state, {number: state.number + 1});
    return newState;
    case "decrement":
    newState = Object.assign({}, state, {number: state.number - 1});
    return newState;
    default:
    // just return state if we dont care about this action type
    return state;
  }
}

// Action
// always has a type { type: "whatYouCareAboutIsCamelCase"}

document.addEventListener('DOMContentLoaded', () => {
  // 1) define the reducer
  // 2) create the store
  const store = createStore(counter);
  window.store = store;
  function render () {
    document.querySelector('span').innerHTML = store.getState().number;
  }
  // by subscribing to render, render will be run every time we dispatch an action
  store.subscribe(render);
  store.subscribe(() => console.log(store.getState()));
  document.querySelector('.add').addEventListener('click', e => {
    // 3a) use store's dispatch to increment our state
    store.dispatch({type: "increment"});
  });

  document.querySelector('.subtract').addEventListener('click', e => {
    // 3b) use store's dispatch to decrement our state
    store.dispatch({type: "decrement"});
  });
});
