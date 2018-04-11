import React from 'react';
import { Link } from 'react-router-dom';

const TweetIndexItem = ({ tweet, author }) => (
  <li>
    <p>
      <Link to={`/users/${author.id}`} >{author.username}:</Link>
    </p>
    <p>{tweet.body}</p>
    <span>{tweet.created_at}</span>
  </li>
);

export default TweetIndexItem;
