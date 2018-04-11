export function fetchTweets() {
  return $.ajax({
    url: '/api/tweets',
    method: 'GET'
  });
}

export function createTweet(tweet) {
  return $.ajax({
    url: '/api/tweets',
    method: 'POST',
    data: tweet
  });
}
