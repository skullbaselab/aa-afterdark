import * as TweetApiUtil from '../util/tweet_api_util';

export const RECEIVE_TWEETS = 'RECEIVE_TWEETS';
export const RECEIVE_TWEET = 'RECEIVE_TWEET';

export const receiveTweets = tweets => {
  return {
    type: RECEIVE_TWEETS,
    tweets,
  };
};

export const receiveTweet = tweet => {
  //
  return {
    type: RECEIVE_TWEET,
    tweet,
  };
};

export const createTweet = (tweet) => (dispatch) => {
  //
  return TweetApiUtil.createTweet(tweet).then((tweet) => {
    return dispatch(receiveTweet(tweet));
  });
};

export const fetchTweets = () => {

  return (dispatch) => {

    return TweetApiUtil.fetchTweets().then((tweets) => {
      return dispatch(receiveTweets(tweets));
    });
  };
};
