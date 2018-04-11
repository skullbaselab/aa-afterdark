import * as APIUtil from '../util/api_util'

export const RECEIVE_TWEET = "RECEIVE_TWEET";
export const RECEIVE_TWEETS = "RECEIVE_TWEETS";
export const FETCH_TWEETS = "FETCH_TWEETS";
export const CREATE_TWEET = "CREATE_TWEET";

export function receiveTweet(tweet) {
  return { type: RECEIVE_TWEET, tweet };
}

export function receiveTweets(tweets) {
  return { type: RECEIVE_TWEETS, tweets };
}

export function fetchTweets() {
  return (dispatch) => {
    dispatch({ type: FETCH_TWEETS });
    return APIUtil.fetchTweets().then(tweets => {
      dispatch(receiveTweets(tweets));
    });
  }
}

export function createTweet(tweet) {
  return (dispatch) => {
    dispatch({ type: CREATE_TWEET });
    return APIUtil.createTweet(tweet).then(tweet => {
      dispatch(receiveTweet(tweet));
    });
  }
}
