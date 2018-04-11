import React, { Component } from 'react';
import { connect } from 'react-redux';
import { allTweets } from '../reducers/selectors';
import { fetchTweets } from '../actions/tweet_actions';
import Spinner from './Spinner';

class TweetIndex extends Component {
  componentDidMount() {
    this.props.fetchTweets();
  }

  render() {
    const { fetching, tweets } = this.props;

    if (fetching) return <Spinner />;
    if (tweets.length === 0) return <p>No tweets to display</p>;

    return (
      <section>
        <h3>All Tweets</h3>
        <ul>
          { tweets.map(tweet => <li key={ tweet.id }>{ tweet.content }</li>) }
        </ul>
      </section>
    );
  }
}

function mapStateToProps(state) {
  return { fetching: state.fetching, tweets: allTweets(state) };
}

function mapDispatchToProps(dispatch) {
  return { fetchTweets: () => {
    return dispatch(fetchTweets());
  }};
}

export default connect(mapStateToProps, mapDispatchToProps)(TweetIndex);
