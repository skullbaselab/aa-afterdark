import React, { Component } from "react";
import { connect } from 'react-redux';
import TweetIndexItem from './tweet_index_item';
import { fetchTweets } from '../actions/tweet_actions';

class TweetIndex extends Component {
  componentDidMount() {

    this.props.fetchTweets();
  }

  render() {
    const tweets = this.props.tweets.map(tweet => {
      return (
        <TweetIndexItem tweet={tweet} key={tweet.id}/>
      );
    });
    return (
      <main>
        <h3>Tweets</h3>
        <ul>
          { tweets }
        </ul>
      </main>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  const tweets = Object.values(state.tweets);
  return {
    tweets: tweets,
    testProp: ownProps.testProp
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchTweets: () => dispatch(fetchTweets()),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TweetIndex);
