import * as APIUtil from '../util/api_util';

export const RECEIVE_TWEETS = 'RECEIVE_TWEETS';
export const RECEIVE_SINGLE_TWEET = 'RECEIVE_SINGLE_TWEET';

export const requestAllTweets = () => (dispatch) => {
  return APIUtil.fetchAllTweets()
    .then(tweets => {dispatch(receiveTweets(tweets))});
}

export const createTweet = tweet => dispatch => (
  APIUtil.createTweet(tweet).then(tweet => {
    dispatch(receiveSingleTweet(tweet));
    return tweet;
  })
);

export const receiveTweets = payload => ({
  type: RECEIVE_TWEETS,
  payload
});

export const receiveSingleTweet = payload => ({
  type: RECEIVE_SINGLE_TWEET,
  payload,
});
