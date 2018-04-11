import { createStore, applyMiddleware } from 'redux';
import thunk from '../middleware/thunk';
import postReducer from '../reducers/postReducer';
import logger from 'redux-logger';

const store = createStore(postReducer, applyMiddleware(thunk, logger));
// createStore sets up the middleware chain, putting reducer last
// logger MUST be the last middleware passed to applyMiddleware

export default store;
