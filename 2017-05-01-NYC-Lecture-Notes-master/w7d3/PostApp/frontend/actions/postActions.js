import * as ApiUtil from '../util/post_api_util';

export const RECEIVE_POST = "RECEIVE_POST";
export const RECEIVE_POSTS = "RECEIVE_POSTS";

export const receivePost = (post) => { // plain old action => Plain Old JavaScript Object
  return {
    type: RECEIVE_POST,
    post, // we don't need this comma, but it's kinda nice for the next person (and git diffs)
  };
};
// const examplePostAfterIteration = { title: '', body: '', comments: [1, 2] };
export const receivePosts = (posts) => {
  let comments = [];
  posts.forEach(post => {
    comments = comments.concat(post.comments);
    // each post came with an array of comment objects
    // we're collecting them into the local variable `comments`
    post.comments = post.comments.map(comment => comment.id);
    // each post will now have an array of its comments' ids instead
  })

  return {
    type: RECEIVE_POSTS,
    posts,
    comments // comments are separated out of the posts, allowing us to normalize our state
    // these comments will no longer end up in the postReducer, but in the commentReducer instead
  };
};

export const updatePost = (post) => {
  // be as semantic in your variable naming as possible in the given context
  // but be concise too!
  return (dispatch) => {
    // importing * as ApiUtil namespaces these functions
    return ApiUtil.updatePost(post) // interacts with our server
      .then( // handles the response on the frontend
        (post) => { // what is post? post is the (JSON) response from our server
          return dispatch(receivePost(post)); // this is why thunk passes in dispatch
        },
        (error) => {
          console.log(error);
        }
      );
  };
};

export const fetchPosts = () => {
  return (dispatch) => {
    return ApiUtil.fetchPosts()
      .then(
        (posts) => {
          return dispatch(receivePosts(posts));
        },
        (error) => {
          console.log(error);
        }
      );
  };
};
