import { RECEIVE_POST, RECEIVE_POSTS } from '../actions/postActions';

const _defaultState = { posts: {} };

const postReducer = (state = _defaultState, action) => {
  let  posts;
  switch (action.type) {
    case RECEIVE_POST:
      debugger
      posts = Object.assign(
        {}, state.posts, {[action.post.id]: action.post}
      );
      return { posts };
    case RECEIVE_POSTS:
      posts = {};
      action.posts.forEach((post) =>{
        posts[post.id] = post;
      });
      return { posts };
    default:
      return state;
  }

};

export default postReducer;
