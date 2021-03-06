import { RECEIVE_TWEETS, RECEIVE_TWEET } from '../actions/tweet_actions';

export default function tweetsReducer(state = {pg: true}, action) {
  switch (action.type) {
    case RECEIVE_TWEETS:
      const newState = {};
      action.tweets.forEach(tweet => newState[tweet.id] = tweet);
      return newState;
    case RECEIVE_TWEET:

      return Object.assign({}, state, { [action.tweet.id]: action.tweet });
    default:
      return state;
  }
}
