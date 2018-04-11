import React from 'react';
import TweetForm from './TweetForm';

export default function App(props) {
  //we need to render props.children
  //props.children are all the components on route with path that matches
  return (
    <div>
      <h1>Tweetstagram</h1>
      { props.children }
      { props.form }
      { props.tweets }
    </div>
  );
}
