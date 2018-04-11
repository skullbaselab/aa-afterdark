import { RECEIVE_POST, RECEIVE_POSTS } from '../actions/postActions';

// const _defaultState = {
//   posts: {
//     1: {
//       id: 1,
//       title: "question",
//       body: "Which bear is best?",
//       like_count: 3
//     },
//     2: {
//       id: 2,
//       title: "statement",
//       body: "Bears beets battelstar galactica",
//       like_count: 2
//     },
//     3: {
//       id: 3,
//       title: "thoughts",
//       body: "Today I hit myself with my phone. I suspect Jim",
//       like_count: 4
//     }
//   }
// };

const postReducer = (state = {posts: {}}, action) => {
  let  posts;
  switch (action.type) {
    case RECEIVE_POST:
      debugger
      posts = Object.assign(
        {}, state.posts, {[action.post.id]: action.post}
      );
      return { posts };
    case RECEIVE_POSTS:
      debugger
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
