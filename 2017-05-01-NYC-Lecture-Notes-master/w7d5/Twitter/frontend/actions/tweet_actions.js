import * as ApiUtil from '../util/tweet_api_util';

export const RECEIVE_TWEETS = "RECEIVE_TWEETS";
export const RECEIVE_TWEET = "RECEIVE_TWEET";

export function fetchTweets() {
  return dispatch => {
    return ApiUtil.fetchTweets().then(tweets => dispatch(receiveTweets(tweets)));
  };
}

export function createTweet(tweet) {
  return dispatch => {
    return ApiUtil.createTweet(tweet).then(tweet => dispatch(receiveTweet(tweet)));
  };
}

export function receiveTweets(tweets) {
  return {
    type: RECEIVE_TWEETS,
    tweets
  };
}
export function receiveTweet(tweet) {
  return {
    type: RECEIVE_TWEET,
    tweet
  };
}
