import React from 'react';

export default function TweetIndex({ tweets }) {
  if (tweets.length === 0) return <p>No tweets to display</p>;
  const tweetItems = tweets.map(tweet => {
    return <li key={ tweet.id }>{ tweet.content }</li>;
  });

  return (
    <section>
      <h3>All Tweets</h3>
      <ul>
        { tweetItems }
      </ul>
    </section>
  );
}
