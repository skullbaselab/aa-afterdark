import { combineReducers } from 'redux';
import fetching from './fetching_reducer';
import tweets from './tweets_reducer';
import session from './session_reducer';

export default combineReducers({ fetching, tweets, session });
