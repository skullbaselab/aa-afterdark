import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import postReducer from '../reducers/postReducer';
import thunk from '../middleware/thunk';

// applyMiddleware updates our dispatch chain, including our thunk
// Note: logger always needs to be the last middleware in the chain
// aka: needs to be the last argument passed to 'applyMiddleware'
const store = createStore(
  postReducer,
  applyMiddleware(thunk, logger)
);

export default store;
