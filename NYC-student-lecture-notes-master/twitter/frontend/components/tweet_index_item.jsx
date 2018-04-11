import React from 'react';
export default function TweetIndexItem({ tweet }) {
  if (tweet.content.indexOf(".com") > -1) {
    return (
      <li>
        <a href={tweet.content} target="_blank">{ tweet.content }</a>
      </li>
    );
  } else {
    return <li key={ tweet.id }>{ tweet.content }</li>;
  }
}
