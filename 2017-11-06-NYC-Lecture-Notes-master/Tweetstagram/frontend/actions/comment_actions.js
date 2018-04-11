import * as APIUtil from '../util/comment_api_util';

export const RECEIVE_COMMENTS = 'RECEIVE_COMMENTS';
export const REMOVE_COMMENT = 'REMOVE_COMMENT';


export const receiveComments = (response) => {
  return {
    type: RECEIVE_COMMENTS,
    response,
  };
};

export const removeComment = (response) => {
  return {
    type: REMOVE_COMMENT,
    response,
  };
};

export const fetchComments = (tweetId) => {
  return (dispatch) => {
    return APIUtil.fetchComments(tweetId).then((response) => {
      return dispatch(receiveComments(response));
    });
  };
};

export const deleteComment = (commentId) => {
  return (dispatch) => {
    return APIUtil.deleteComment(commentId).then((response) => {
      return dispatch(removeComment(response));
    });
  };
};
