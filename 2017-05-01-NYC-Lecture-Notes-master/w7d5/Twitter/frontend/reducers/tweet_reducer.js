import merge from 'lodash/merge';
import { RECEIVE_TWEETS, RECEIVE_TWEET } from '../actions/tweet_actions';

export default function(state={}, action) {
  switch (action.type) {
    case RECEIVE_TWEETS:
      return action.tweets;
    case RECEIVE_TWEET:
      return merge({}, state, {[action.tweet.id]: action.tweet});
    default:
      return state;
  }
}
