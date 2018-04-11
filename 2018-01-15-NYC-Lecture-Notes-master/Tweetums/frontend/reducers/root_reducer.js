import { combineReducers } from 'redux';
import tweets from './tweets_reducer';
import users from './users_reducer';
import session from './session_reducer';

export default combineReducers({ tweets, users, session });
