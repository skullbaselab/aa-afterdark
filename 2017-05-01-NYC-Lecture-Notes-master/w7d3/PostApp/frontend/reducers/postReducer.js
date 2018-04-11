import { RECEIVE_POST, RECEIVE_POSTS } from '../actions/postActions';

const _defaultState = { };

// why do we care about data normalization?
// avoid data nesting and data duplication
// becomes a huge problem pretty quickly as your app grows
// data normalization organizes everything at the top level

const postReducer = (state = _defaultState, action) => {
  let  posts;
  switch (action.type) { // always looking for an object with a 'type' property
    case RECEIVE_POST:
      debugger
      posts = Object.assign(
        {}, state.posts, {[action.post.id]: action.post}
      );
      return posts;
    case RECEIVE_POSTS:
      posts = {};
      action.posts.forEach((post) =>{
        posts[post.id] = post;
      });
      return posts;
    default:
      return state;
  }

};

export default postReducer;
