export function fetchTweets() {
  debugger
  return $.ajax({
    method: "GET",
    url: "/api/tweets"
  });
}

export function createTweet(tweet) {
  return $.ajax({
    method: "POST",
    url: "/api/tweets",
    data: { tweet }
  });
}
