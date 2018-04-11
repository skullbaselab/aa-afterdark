export const postsFromState = (state) => {
  return Object.keys(state.posts).map((id) => {
    return state.posts[id];
  });
};
