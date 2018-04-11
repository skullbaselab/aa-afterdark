import * as APIUtil from '../api_util';

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

// THUNKS

export function fetchTweets() {
  debugger
  return (dispatch) => {
    debugger
    dispatch({ type: FETCH_TWEETS }); //just to show the spinner
    return APIUtil.fetchTweets().then(tweets => {
      debugger
      dispatch(receiveTweets(tweets));
    });
  };
}

export function createTweet(tweet) {
  return (dispatch) => {
    dispatch({ type: CREATE_TWEET });
    return APIUtil.createTweet(tweet).then(tweet => {
      dispatch(receiveTweet(tweet));
    });
  };
}
