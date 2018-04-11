import React from 'react'
import { connect } from 'react-redux'
import TweetIndex from './tweet_index'
import {
  fetchTweets,
  destroyTweet
} from '../../../actions/tweet_actions';

const mapStateToProps = state => {
  const tweets = Object.values(state.tweets).reverse();
  // copy our users slice of state
  // keep it as an object so we can immediately index into it
  // using our author_id from our tweet
  const users = Object.assign({}, state.users);
  return {
    tweets,
    users,
    currentUserId: state.session.id
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchTweets: () => dispatch(fetchTweets()),
    destroyTweet: id => dispatch(destroyTweet(id))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TweetIndex);
