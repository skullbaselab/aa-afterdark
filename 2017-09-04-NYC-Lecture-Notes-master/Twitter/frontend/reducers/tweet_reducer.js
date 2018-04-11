import { ADD_TWEET, ADD_TWEETS } from "../actions/tweet";
import { RECEIVE_USER } from "../actions/user_actions";

const initialState = {};

export default function tweets(state = initialState, action) {
  let newState;
  switch (action.type) {
    case ADD_TWEET:
      return Object.assign({}, state, { [action.tweet.id]: action.tweet });
    case ADD_TWEETS:
      newState = {};
      action.tweets.forEach(tweet => (newState[tweet.id] = tweet));
      return Object.assign({}, state, newState);
    case RECEIVE_USER:
      newState = {};
      action.payload.tweets.forEach((tweet) => (newState[tweet.id] = tweet));
      return Object.assign({}, state, newState);
    default:
      return state;
  }
}











// comment
