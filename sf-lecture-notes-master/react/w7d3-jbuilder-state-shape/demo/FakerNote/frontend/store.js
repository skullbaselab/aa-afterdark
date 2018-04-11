import {createStore, applyMiddleware} from 'redux';
import rootReducer from './reducers/root_reducer.js';
import UserMiddleware from './middleware/user_middleware.js';
import createLogger from 'redux-logger';

const configureStore = (preloadedState) => (
  createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(UserMiddleware, createLogger())
  )
);

export default configureStore;
