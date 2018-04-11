import React from 'react';
import { connect } from 'react-redux';
import { selectTweets } from '../reducers/selectors';
import { requestAllUsers } from '../actions/user_actions';
import { requestAllTweets } from '../actions/tweet_actions';
import TweetIndexItem from './tweet_index_item';
import TweetForm from './tweet_form';

class TweetIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllUsers().then(this.props.requestAllTweets);
  }

  render() {
    const tweets = this.props.tweets.map(tweet => {
      return (
        <TweetIndexItem
          key={tweet.id}
          tweet={tweet}
          author={this.props.users[tweet.author_id]}
        />
      );
    });

    return (
      <div className="tweets">
        <h2>All the Tweets!</h2>
        <TweetForm />
        <ul>
          {tweets}
        </ul>
      </div>
    );
  }
}

const mapStateToProps = (state) => ({
  tweets: selectTweets(state),
  users: state.entities.users
});

const mapDispatchToProps = (dispatch) => ({
    requestAllUsers: () => dispatch(requestAllUsers()),
    requestAllTweets: () => dispatch(requestAllTweets()),
});

export default connect(mapStateToProps, mapDispatchToProps)(TweetIndex);
