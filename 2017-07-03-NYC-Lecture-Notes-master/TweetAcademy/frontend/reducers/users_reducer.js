import { RECEIVE_USERS, RECEIVE_SINGLE_USER } from '../actions/user_actions';
import { RECEIVE_SINGLE_LIST } from '../actions/list_actions';

const usersReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_USERS:
      return Object.assign({}, state, action.users);

    case RECEIVE_SINGLE_USER:
      const user = action.payload.user;
      user.tweet_ids = action.payload.tweets.map(tweet => tweet.id);
      user.list_ids = action.payload.lists.map(list => list.id);

      return Object.assign({}, state, {[user.id]: user});

    case RECEIVE_SINGLE_LIST:
      const users = action.payload.users.reduce((acc, user) => {
        acc[user.id] = user;
        return acc;
      }, {});

      return Object.assign({}, state, users);

    default:
      return state;
  }
};

export default usersReducer;
