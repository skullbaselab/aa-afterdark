import * as APIUtil from '../util/post_api_util';

export const RECEIVE_POST = "RECEIVE_POST";
export const RECEIVE_POSTS = "RECEIVE_POSTS";

export const receivePost = (post) => {
  debugger
  return {
    type: RECEIVE_POST,
    post,
  };
};

export const receivePosts = (posts) => {
  debugger
  return {
    type: RECEIVE_POSTS,
    posts,
  };
};

export const updatePost = (post) => {
  debugger
  return (dispatch) => {
    debugger
    return APIUtil.updatePost(post)
      .then(
        (updatedPost) => {
          debugger
          return dispatch(receivePost(updatedPost));
        },
        (error) => console.log(error)
      );
  };
};

export const fetchPosts = () => {
  debugger
  return (dispatch) => {
    debugger
    return APIUtil.fetchPosts()
      .then(
        (posts) => {
          debugger
         dispatch(receivePosts(posts));
         return 'thingy did the thing!'
        },
        (error) => console.log(error)
      );
  };
};















// bottom
