import {
  RECEIVE_TWEETS,
  RECEIVE_TWEET,
  CREATE_TWEET,
  FETCH_TWEETS
} from '../actions/tweet_actions';

export default function fetchingReducer(state = false, action) {
  switch (action.type) {
    case CREATE_TWEET:
    case FETCH_TWEETS:
      return true;
    case RECEIVE_TWEETS:
    case RECEIVE_TWEET:
      return false;
    default:
      return state;
  }
}
