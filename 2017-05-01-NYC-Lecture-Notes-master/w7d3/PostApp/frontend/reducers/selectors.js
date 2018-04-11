export const postsFromState = (state) => {
  // just returns an array of the posts from the state
  return Object.keys(state.posts).map((id) => {
    return state.posts[id];
  });
};

export const commentsFromState = (state, commentIds) => {
  // returns an array of the selected comments from state
  return commentIds.map(id => state.comments[id]);
};
