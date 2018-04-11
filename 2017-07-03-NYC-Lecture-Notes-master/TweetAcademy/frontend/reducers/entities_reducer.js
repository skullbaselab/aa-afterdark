import { combineReducers } from 'redux';

import tweets from './tweets_reducer';
import users from './users_reducer';
import lists from './lists_reducer';

export default combineReducers({
  tweets,
  users,
  lists,
});
