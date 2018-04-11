import * as APIUtil from '../api_util';

export const RECEIVE_TWEET = "RECEIVE_TWEET";
export const RECEIVE_TWEETS = "RECEIVE_TWEETS";
export const FETCH_TWEETS = "FETCH_TWEETS";
export const FETCH_TWEET = "FETCH_TWEET";
export const CREATE_TWEET = "CREATE_TWEET";

// SHARED

export function receiveTweets(tweets) {
  return { type: RECEIVE_TWEETS, tweets };
}

export function receiveTweet(tweet) {
  return { type: RECEIVE_TWEET, tweet };
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


// THUNKS

export function fetchTweets() {
  return (dispatch) => {
    dispatch({ type: FETCH_TWEETS });
    return APIUtil.fetchTweets().then(tweets => {
      return dispatch(receiveTweets(tweets));
    }); // ALWAYS return promise from inside redux action -- .then returns a promise with the return value of the inner callback passed as an argument
  };
}

export function fetchTweet(id) {
  return (dispatch) => {
    dispatch({ type: FETCH_TWEET }); // for spinner
    return APIUtil.fetchTweet(id).then(tweets => {
      return dispatch(receiveTweet(tweets));
    });
  };
}

export function createTweet(tweet) {
  return (dispatch) => {
    dispatch({ type: CREATE_TWEET });
    return APIUtil.createTweet(tweet).then(tweet => {
      return dispatch(receiveTweet(tweet));
    });
  };
}
