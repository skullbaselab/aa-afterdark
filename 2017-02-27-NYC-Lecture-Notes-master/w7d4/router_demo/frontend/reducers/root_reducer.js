import { combineReducers } from 'redux';
import fetching from './fetching_reducer';
import { tweets, tweet } from './tweets_reducer';

export default combineReducers({
  fetching,
  tweets,
  tweet
});
