export const createTweet = tweet => {
  // 
  return $.ajax({
    url: 'api/tweets',
    method: 'POST',
    data: {
      tweet
    }
  });
};

export const fetchTweets = () => {
  return $.ajax({
    url: 'api/tweets',
    method: 'GET',
  });
};
