import { combineReducers } from 'redux';
import fetching from './fetching_reducer';
import tweets from './tweets_reducer';

export default combineReducers({ fetching, tweets });
