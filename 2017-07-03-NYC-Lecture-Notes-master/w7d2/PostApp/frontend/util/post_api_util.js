export const updatePost = (post) => {
  return $.ajax({
    method: 'PATCH',
    url: `api/posts/${post.id}`,
    data: {
      post: post
      // post
    }
  });
};

export const fetchPosts = () => {
  // Why return??
  // We want access to the promise that our ajax function invocation returns
  // in order to handle a successful or failed request
  return $.ajax({
    method: 'GET',
    url: 'api/posts'
  });
};
