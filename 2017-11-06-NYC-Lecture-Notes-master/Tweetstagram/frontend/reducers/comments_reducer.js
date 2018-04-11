
import { RECEIVE_COMMENTS, REMOVE_COMMENT } from '../actions/comment_actions';

export default function commentsReducer(state = {}, action) {
  let newState;
  switch (action.type) {
    case RECEIVE_COMMENTS:
      return Object.assign({}, state, action.response);
      // we lose previously existing comments by doing below
      // return action.response;
    case REMOVE_COMMENT:
      newState = Object.assign({}, state);
      delete newState[action.response.commentId];
      return newState;
    // case REMOVE_TWEET:
    // remove comments on that tweet
    default:
    return state;
  }
}
