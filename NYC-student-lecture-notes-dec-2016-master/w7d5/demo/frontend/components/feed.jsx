import React, { Component } from 'react';
import { connect } from 'react-redux';
import Spinner from './spinner';
import TweetIndex from './tweet_index';
import TweetForm from './tweet_form';
import LogOutButton from './log_out_button';
import { allTweets } from '../reducers/selectors';
import { fetchTweets } from '../actions/tweet_actions';

class App extends Component {

  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTweets();
  }

  render() {
    const { fetching, tweets } = this.props;
    if (fetching) return <Spinner />;
    return (
      <main>
        <h1>Tweetstagram</h1>
        <LogOutButton />
        <TweetForm />
        <TweetIndex tweets={ tweets } />
      </main>
    );
  }

}

function mapStateToProps(state) {
  return { fetching: state.fetching, tweets: allTweets(state) };
}

function mapDispatchToProps(dispatch) {
  return { fetchTweets: () => dispatch(fetchTweets()) };
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
