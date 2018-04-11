// MAKE AJAX CALLS TO OUR RAILS API HERE

export const fetchTweets = function () {
  return $.ajax('api/tweets');
}

// export fetchTweets;
