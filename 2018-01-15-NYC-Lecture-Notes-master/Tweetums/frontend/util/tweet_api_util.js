// Fetch all tweets

// Explicit return
export const fetchAllTweets = () => {
  return $.ajax({
    url: '/api/tweets',
    method: 'GET'
  })
}

// Implicit return
export const makeNewTweet = newTweet =>
  $.ajax({
    url: '/api/tweets',
    method: 'POST',
    data: { tweet: newTweet }
  })

export const deleteTweet = id => {
  return $.ajax({
    url: `/api/tweets/${id}`,
    method: 'DELETE'
  })
}
