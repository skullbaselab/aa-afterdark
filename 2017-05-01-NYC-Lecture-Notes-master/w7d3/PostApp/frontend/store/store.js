import { createStore, applyMiddleware } from 'redux';
import thunk from '../middleware/thunk';
import rootReducer from '../reducers/rootReducer';
import logger from 'redux-logger';

const store = createStore(
  rootReducer, 
  applyMiddleware(thunk, logger)
);
// createStore sets up the middleware chain, putting reducer last
// logger MUST be the last middleware passed to applyMiddleware

export default store;
