import * as APIUtil from '../util/tweets_api_util';

export const RECEIVE_TWEET = "RECEIVE_TWEET";
export const RECEIVE_TWEETS = "RECEIVE_TWEETS";
export const FETCH_TWEETS = "FETCH_TWEETS";
export const CREATE_TWEET = "CREATE_TWEET";

// SHARED

export function receiveTweet(tweet) {
  return { type: RECEIVE_TWEET, tweet };
}

export function receiveTweets(tweets) {
  return { type: RECEIVE_TWEETS, tweets };
}

// MIDDLEWARE STRATEGIES

// SYNC ACTIONS WITH SIDE EFFECTS

// export function fetchTweets() {
//   return { type: FETCH_TWEETS };
// }
//
// export function createTweet(tweet) {
//   return { type: CREATE_TWEET, tweet };
// }

// PROMISES
//
// export function fetchTweets() {
//   return APIUtil.fetchTweets().then(tweets => receiveTweets(tweets));
// }
//
// export function createTweet(tweet) {
//   return APIUtil.createTweet(tweet).then(tweet => receiveTweet(tweet));
// }

// THUNKS

export function fetchTweets() {
  return (dispatch) => {
    dispatch({ type: FETCH_TWEETS });
    return APIUtil.fetchTweets().then(tweets => {
      dispatch(receiveTweets(tweets));
    });
  };
}

export function createTweet(tweet) {
  return (dispatch, getState) => {
    dispatch({ type: CREATE_TWEET });
    return APIUtil.createTweet(tweet).then(tweet => {
      dispatch(receiveTweet(tweet));
    });
  };
}
