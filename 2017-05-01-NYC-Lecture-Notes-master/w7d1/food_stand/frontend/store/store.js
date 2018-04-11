import { createStore } from 'redux';
import rootReducer from '../reducers/rootReducer';

const store = createStore(
  rootReducer
);

export default store;


// getState()
// -> Returns an object that represents state of app at that point

// dispatch
// -> Means of communicating with store
// -> Given to connected components so they can put actions through the loop
