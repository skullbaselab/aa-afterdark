import { RECEIVE_TWEETS, RECEIVE_SINGLE_TWEET } from '../actions/tweet_actions';
import { RECEIVE_SINGLE_USER } from '../actions/user_actions';

const tweetsReducer = (state = {index: {}, ord: []}, action) => {
  switch (action.type) {
    case RECEIVE_TWEETS:
      return Object.assign({}, state, action.payload);

    case RECEIVE_SINGLE_TWEET:
      const tweet = action.payload.tweet;
      const index = Object.assign({}, state.index, { [tweet.id]: tweet });
      const ord = [tweet.id].concat(state.ord)

      return { index, ord }

    case RECEIVE_SINGLE_USER:
      const tweets = action.payload.tweets.reduce((acc, tweet) => {
        acc[tweet.id] = tweet;
        return acc;
      }, {});
      const newIndex = Object.assign({}, state.index, tweets);

      return Object.assign({}, state, { index: newIndex });

    default:
      return state;
  }
};

export default tweetsReducer;
