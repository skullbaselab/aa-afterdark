import { RECEIVE_TWEETS, RECEIVE_TWEET } from '../actions/tweet_actions';

export  function tweets(state = {}, action) {
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

export function tweet(state = {}, action) {
  switch (action.type) {
    case RECEIVE_TWEET:
      return action.tweet;
    default:
      return state;
  }
}
