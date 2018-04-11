import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';
import logger from '../middleware/logger.js';

const configureStore = (preloadedState = {}) => {
  // const store = createStore(RootReducer, preloadedState);
  const store = createStore(RootReducer, preloadedState, applyMiddleware(logger));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
