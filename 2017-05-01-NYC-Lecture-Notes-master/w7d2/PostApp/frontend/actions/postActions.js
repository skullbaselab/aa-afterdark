import * as ApiUtil from '../util/post_api_util';

export const RECEIVE_POST = "RECEIVE_POST";
export const RECEIVE_POSTS = "RECEIVE_POSTS";

export const receivePost = (post) => {
  return {
    type: RECEIVE_POST,
    post,
  };
};

export const receivePosts = (posts) => {
  return {
    type: RECEIVE_POSTS,
    posts,
  };
};

export const updatePost = (post) => {
  debugger
  return (dispatch) => {
    debugger
    return ApiUtil.updatePost(post)
      .then(
        (post) => {
          debugger
          return dispatch(receivePost(post));
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
          debugger
          return dispatch(receivePosts(posts));
        },
        (error) => {
          console.log(error);
        }
      );
  };
};
