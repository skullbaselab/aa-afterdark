import React, { Component } from 'react';
import { connect } from 'react-redux';
import { allTweets } from '../reducers/selectors';
import { fetchTweets } from '../actions/tweet_actions';
import Spinner from './Spinner';
import TweetForm from './TweetForm'
import { Link, Route } from 'react-router-dom';


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
        <Route path='/tweets/new' component={TweetForm} />
        <h3>All Tweets</h3>
        <ul>
          { tweets.map(tweet => {
            return (<li key={ tweet.id }>
              <Link to={`/tweets/${tweet.id}`}>{ tweet.content }</Link>
            </li>)
          }

            ) }
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
