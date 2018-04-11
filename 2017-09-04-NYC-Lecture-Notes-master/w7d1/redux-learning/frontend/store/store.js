import { createStore } from 'redux';
import rootReducer from '../reducers/rootReducer';

const store = createStore(rootReducer);

export default store;

// const configureStore = (preloadedState = {}) => {
//   return createStore(rootReducer, preloadedState);
// };
//
// export default configureStore;
