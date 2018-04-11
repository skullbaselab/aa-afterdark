import { createStore, applyMiddleware } from 'redux';
import rootReducer from './reducers/root_reducer';
import logger from './middleware/logger';
import async from './middleware/async';
import promise from './middleware/promise';
import thunk from './middleware/thunk';

export default createStore(rootReducer, applyMiddleware(thunk, logger));
