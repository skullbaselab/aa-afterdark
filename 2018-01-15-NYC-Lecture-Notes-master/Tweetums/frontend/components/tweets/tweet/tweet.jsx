import React from 'react'
import { Link } from 'react-router-dom'

const Tweet = ({ tweet, author, destroyTweet, isCurrentUserTweet }) => (

  <article className="tweet">
    <h2>{tweet.body}</h2>
    <Link to={`/users/${author.id}`}>
      <h3>{author.username}</h3>
    </Link>
    {
      isCurrentUserTweet &&
      <button onClick={() => destroyTweet(tweet.id)}>
        Delete this Tweetum
      </button>
    }
  </article>
)

export default Tweet
