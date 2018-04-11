import React from 'react';
import { connect } from 'react-redux';
import { fetchTweets } from '../actions/tweet_actions';
import { values } from 'lodash';

function selectAllTweets(tweets) {
  return values(tweets);
}

function mapStateToProps({tweets}) {
  return {
    tweets: selectAllTweets(tweets)
  };
}

function mapDispatchToProps(dispatch) {
  return {
    fetchTweets: () => dispatch(fetchTweets())
  };
}

class TweetIndex extends React.Component {

  componentDidMount() {
    this.props.fetchTweets();
  }
  render() {
    const tweets = this.props.tweets.map(tweet => {
      return <li className="tweet" key={tweet.id}>{tweet.body}</li>;
    });
    return (

      <ul>{tweets}</ul>
    );
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(TweetIndex);
