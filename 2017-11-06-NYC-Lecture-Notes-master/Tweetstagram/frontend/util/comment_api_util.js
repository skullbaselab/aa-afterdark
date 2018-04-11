export const fetchComments = (tweetId) => {
  return $.ajax({
    url: `/api/tweets/${tweetId}/comments`,
    method: 'get',
  });
};

export const deleteComment = (commentId) => {
  return $.ajax({
    url: `/api/comments/${commentId}`,
    method: 'delete',
  });
};
