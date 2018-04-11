import React, { Component } from 'react';
import { fetchTweets } from '../actions/tweet_actions';
import { allTweets } from '../reducers/selectors';
import { connect } from 'react-redux';
import Spinner from './spinner';
import { Link } from 'react-router';
import TweetIndexItem from './tweet_index_item';

// export default function TweetIndex({ tweets }) {
//   if (tweets.length === 0) return <p>No tweets to display</p>;
//   const tweetItems = tweets.map(tweet => {
//     return <li key={ tweet.id }>{ tweet.content }</li>
//   });
//
//   return (
//     <section>
//       <h3>All Tweets</h3>
//       <ul>
//         { tweetItems }
//       </ul>
//     </section>
//   )
// }

class TweetIndex extends Component {
  constructor() {
    super();
  }

  componentDidMount() {
    this.props.fetchTweets();
  }

  render() {
    const { fetching, tweets, children } = this.props;

    if (fetching) return <Spinner/>;
    const tweetItems = tweets.map(tweet => {
      return <TweetIndexItem key = { tweet.id } tweet={tweet}/>;
    });

    return (
      <section>
        { children }
        <Link to="/new">Make you a tweet</Link>
        <h3>All Tweets</h3>
        <ul>
          { tweetItems }
        </ul>
      </section>
    );
  }
}

const mapStateToProps = state => {
  return {
    tweets: allTweets(state),
    fetching: state.fetching
  };
};

const mapDispatchToProps = dispatch => ({
  fetchTweets: () => dispatch(fetchTweets())
});

export default connect(mapStateToProps, mapDispatchToProps)(TweetIndex);
