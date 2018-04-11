import { RECEIVE_TWEET, RECEIVE_TWEETS } from '../actions/tweet_actions';
import { REMOVE_COMMENT } from '../actions/comment_actions';


const tweetsReducer = (state = {}, action) => {
  let newState = {};
  switch (action.type) {
    case RECEIVE_TWEET:
      return Object.assign(
        {}, state, { [action.tweet.id]: action.tweet }
      );
    case RECEIVE_TWEETS:
    return action.tweets;
    // don't have to iterate over action.tweets anymore because we formatted our response as an object with jbuilder
      // action.tweets.forEach(tweet => {
      //   newState[tweet.id] = tweet;
      // });
      // return newState;
    case REMOVE_COMMENT: //every dispatched action hits every reducer, so we can respond to any action
      newState = Object.assign({}, state);
      // here we need to remove the removed commentId from the appropritate tweet's commentIds
      // another approach would be to send back the entire tweet, which has the correct aray of commentIds, and
      // ust replace the entire tweet in your redux state
      const tweet = newState[action.response.tweetId];
      tweet.commentIds = tweet.commentIds.filter((commentId) => {
        return commentId !== action.response.commentId;
      });
      return newState;
    default:
      return state;
  }
};

export default tweetsReducer;
