import React, { Component } from "react";
import { connect } from 'react-redux';
import TweetIndexItem from './tweet_index_item';
import { fetchTweets } from '../actions/tweet_actions';

class UserShow extends Component {
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
        <h3>User #{this.props.match.params.id}s Tweets</h3>
        <ul>
          { tweets }
        </ul>
      </main>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  // TODO: pull out only relevant tweets

  const tweets = Object.values(state.tweets).filter(tweet => (
    tweet.author_id === parseInt(ownProps.match.params.id)
  ));

  return {
    tweets: tweets,
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchTweets: () => dispatch(fetchTweets()),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserShow);
