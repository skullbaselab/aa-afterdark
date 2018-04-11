import * as TweetApi from "../util/api_util"

export const ADD_TWEET = "ADD_TWEET"
export const ADD_TWEETS = "ADD_TWEETS"


export const addTweet = tweet => {
  return {
    type: ADD_TWEET,
    tweet
  }
}

export const addTweets = tweets => {
  return {
    type: ADD_TWEETS,
    tweets
  }
}

export const fetchTweets = () => {
  return function (dispatch) {
    return TweetApi.fetchTweets().then(tweets => {
      return dispatch(addTweets(tweets));
    });
  };
}














// end of document
