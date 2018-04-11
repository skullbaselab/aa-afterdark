import { combineReducers } from 'redux';
import tweetsReducer from './tweets_reducer';
import commentsReducer from './comments_reducer';
import sessionReducer from './session_reducer';

// order of your reducers here shouldn't matter, because reducers don't have access to other reducers' slices of state
export default combineReducers({
  tweets: tweetsReducer,
  comments: commentsReducer,
  session: sessionReducer,
});
