export function fetchTweets() {
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

export function signIn(user) {
  return $.ajax({
    method: "POST",
    url: "/api/session",
    data: { user }
  });
}

export function signUp(user) {
  return $.ajax({
    method: "POST",
    url: "/api/users",
    data: { user }
  });
}

export function signOut() {
  return $.ajax({
    method: "DELETE",
    url: "/api/session"
  });
}
