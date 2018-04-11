import merge from 'lodash/merge';
import {
  RECEIVE_TWEET,
  RECEIVE_ALL_TWEETS,
  REMOVE_TWEET,
} from '../actions/tweet_actions';

const tweetsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;
  switch (action.type) {
    case RECEIVE_ALL_TWEETS:
      // newState = merge({}, state);
      // // this SUCKS (sorry, matt! not your fault I guess...)
      // action.tweets.forEach(tweet => {
      //   newState[tweet.id] = tweet;
      // });
      // 😎
      return merge({}, state, action.tweets);

    case RECEIVE_TWEET:
      // newState = merge({}, state);
      // // Exactly the same as writing const tweet = action.tweet;
      // const { tweet } = action;
      // newState[tweet.id] = tweet;
      // return newState;

      // same effect as above:
      return merge({}, state, { [action.tweet.id]: action.tweet });

    case REMOVE_TWEET:
      newState = merge({}, state);
      delete newState[action.tweetId];
      return newState;

    default:
      return state;
  }
};

export default tweetsReducer;
