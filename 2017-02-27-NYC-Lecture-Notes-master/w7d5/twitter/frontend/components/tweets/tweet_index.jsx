import React, { Component } from 'react';

export default function TweetIndex({ tweets }) {

  if (tweets.length === 0) return <p>No tweets to display</p>;

  const tweetItems = tweets.map(tweet => {
    return (
      <li key={ tweet.id }>{ tweet.content }<br />
        <span style={{"fontWeight": 700}}>{tweet.author.username}</span>
      </li>
    )
  });

  return (
    <section>
      <h3>All Tweets</h3>
      <ul>
        { tweetItems }
      </ul>
    </section>
  )
}
