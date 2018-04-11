import { combineReducers } from 'redux';
import fetching from './fetching_reducer';
import tweets from './tweets_reducer';

export default combineReducers({
  fetching: fetching, // fetching reducer gets state.fetching
  tweets: tweets // tweets reducer gets state.tweets
});
