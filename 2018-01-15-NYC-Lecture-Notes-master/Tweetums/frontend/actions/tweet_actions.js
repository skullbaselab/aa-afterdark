import {
  fetchAllTweets,
  makeNewTweet,
  deleteTweet
} from '../util/tweet_api_util'

export const RECEIVE_ALL_TWEETS = 'RECEIVE_ALL_TWEETS'
export const RECEIVE_TWEET = 'RECEIVE_TWEET'
export const REMOVE_TWEET = 'REMOVE_TWEET'

export const receiveAllTweets = payload => ({
  type: RECEIVE_ALL_TWEETS,
  tweets: payload.tweets,
  users: payload.users
})

export const receiveTweet = tweet => {
  return {
    type: RECEIVE_TWEET,
    tweet
  }
}

export const removeTweet = tweetId => {
  return {
    type: REMOVE_TWEET,
    tweetId
  }
}

export const fetchTweets = () => {
  return dispatch => {
    fetchAllTweets().then(payload =>
      dispatch(receiveAllTweets(payload))
    )
  }
}

export const createTweet = tweet => {
  return dispatch => {
    return makeNewTweet(tweet).then(tweet =>
      dispatch(receiveTweet(tweet))
    )
  }
}
export const destroyTweet = id => {
  return dispatch => {
    deleteTweet(id).then(() => dispatch(removeTweet(id)))
  }
}
