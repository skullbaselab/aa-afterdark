import { createStore, applyMiddleware } from 'redux';
import teasReducer from '../reducers/teas_reducer';
// import rootReducer from '../reducers/root_reducer';
import logger from 'redux-logger';

const configureStore = () => createStore(
  teasReducer,
  applyMiddleware(logger)
);

export default configureStore;