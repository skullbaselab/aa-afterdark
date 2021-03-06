import { fetchTweets, createTweet } from '../api_util';
import {
  FETCH_TWEETS,
  CREATE_TWEET,
  receiveTweets,
  receiveTweet
} from '../actions/tweet_actions';

export default function({ dispatch, getState }) {
  return (next) => (action) => {
    switch (action.type) {
      case FETCH_TWEETS:
        fetchTweets().then(tweets => dispatch(receiveTweets(tweets)));
        break;
      case CREATE_TWEET:
        createTweet(action.tweet).then(tweet => {
          dispatch(receiveTweet(tweet));
        });
        break;
    }
    return next(action);
  }
}
