import React, { Component } from 'react';
import { connect } from 'react-redux';
import Spinner from './spinner';
import TweetIndex from './tweet_index';
import TweetForm from './tweet_form';
import { allTweets } from '../reducers/selectors';
import { fetchTweets } from '../actions/tweet_actions';

class App extends Component {

  fetchAndLogTweets() {
    const val = this.props.fetchTweets();
    console.log('%c Dispatch return value:', 'color: blue', val);
    val.then && val.then(() => console.log("Fetched tweets."))
  }

  componentDidMount() {
    // this.props.fetchTweets();
    this.fetchAndLogTweets();
  }

  render() {
    const { fetching, tweets } = this.props;
    if (fetching) return <Spinner />;
    return (
      <main>
        <h1>Tweetstagram</h1>
        <TweetForm />
        <TweetIndex tweets={ tweets } />
      </main>
    )
  }

}

function mapStateToProps(state) {
  return { fetching: state.fetching, tweets: allTweets(state) };
}

function mapDispatchToProps(dispatch) {
  return { fetchTweets: () => dispatch(fetchTweets()) };
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
