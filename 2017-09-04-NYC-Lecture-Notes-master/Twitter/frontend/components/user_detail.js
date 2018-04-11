import React, { Component } from 'react';
import { fetchUser } from '../actions/user_actions';
import { connect } from 'react-redux';

class UserDetail extends Component {
  componentDidMount() {
    this.props.fetchUser(this.props.userId);
  }

  render() {
    const tweets = this.props.tweets.map((tweet) => {
      return (
        <h2 key={tweet.id}>{tweet.body}</h2>
      );
    });

    return (
      <div>
        <h1>User Detail</h1>
        <h2>
          { this.props.user.username }
        </h2>
        <ul>
          { tweets }
        </ul>
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  const user = state.users[ownProps.userId] || { username: '', tweetIds: [] };
  const tweets = user.tweetIds.map((tweetId) => {
    return state.tweets[tweetId];
  });
  return {
    user,
    tweets,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    fetchUser: (id) => dispatch(fetchUser(id)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserDetail);










// comment
