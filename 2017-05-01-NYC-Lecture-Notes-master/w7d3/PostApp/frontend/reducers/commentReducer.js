import { RECEIVE_POSTS } from '../actions/postActions';

const _defaultState = { }; // a bunch of comments

const commentReducer = (state = _defaultState, action) => {
  let  comments;
  switch (action.type) {
    case RECEIVE_POSTS: // cares about a posts action! needs to grab the comments that came with them
      const newComments = {};
      action.comments.forEach(comment => {
        newComments[comment.id] = comment
      })

      comments = Object.assign(
        {}, state.comments, newComments
      );
      return comments; // doesn't erase the previous comments, just adds to them
    default:
      return state;
  }

};

export default commentReducer;
