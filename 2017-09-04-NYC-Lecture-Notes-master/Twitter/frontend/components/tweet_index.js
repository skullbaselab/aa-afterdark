import React, { Component } from "react";
import { connect } from "react-redux";
import { fetchTweets } from "../actions/tweet";
import { logout } from "../actions/session_actions";

class TweetIndex extends Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    // fetch tweets
    this.props.fetchTweets().then(() => console.log('Tweets have been fetched!'));
  }

  render() {
    return (
      <main>
        <h1>Hi, {this.props.currentUser.username}</h1>
        <button onClick={this.props.logout}>Logout!</button>
        <h1>Tweets Index</h1>
        {this.props.tweets.map((tweet) => {
          return (
            <h2 key={tweet.id}>{tweet.body}</h2>
          );
        })}
      </main>
    );
  }
}

function tweetSelector(state) {
  return Object.keys(state.tweets).map((tweetId) => {
    return state.tweets[tweetId];
  });
}

function mapStateToProps(state) {
  return {
    tweets: tweetSelector(state),
    currentUser: state.session.currentUser,
  };
}

function mapDispatchToProps(dispatch) {
  return {
    fetchTweets: () => {
      return dispatch(fetchTweets());
    },
    logout: () => dispatch(logout())
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(TweetIndex);















// end of document
