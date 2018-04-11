import { createStore, applyMiddleware } from 'redux';
import rootReducer from './reducers/root_reducer';
import logger from './middleware/logger';
import thunk from './middleware/thunk';

export default createStore(rootReducer, applyMiddleware(thunk, logger));
//Do not need to pass in a placeholder for preLoadedState!
//applyMiddleware can be passed as 2nd arg
//put logger last
