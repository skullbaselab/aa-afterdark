import {
  RECEIVE_TWEETS,
  RECEIVE_TWEET,
  CREATE_TWEET,
  FETCH_TWEETS,
  FETCH_TWEET
} from '../actions/tweet_actions';

export default function fetchingReducer(state = false, action) {
  switch (action.type) {
    case FETCH_TWEETS:
    case FETCH_TWEET:
      return true;
    case RECEIVE_TWEETS:
    case RECEIVE_TWEET:
      return false;
    default:
      return state;
  }
}
