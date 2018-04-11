import React from 'react';
import { connect } from 'react-redux';

import Spinner from './Spinner';
import { fetchTweet } from '../actions/tweet_actions';

const mapStateToProps = ({ fetching, tweet}) => ({ fetching, tweet });

const mapDispatchToProps = (dispatch) => ({
  fetchTweet: (id) => dispatch(fetchTweet(id))
});

class Tweet extends React.Component {

  componentDidMount () {
    this.props.fetchTweet(this.props.params.id);
  }

  componentWillReceiveProps (newProps) {
    if (newProps.params.id != this.props.params.id) {
      this.props.fetchTweet(newProps.params.id);
    }
  }

  render() {
    if (this.props.fetching) { return <Spinner />; }

    return (
      <div>{ this.props.tweet.content }</div>
    );
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Tweet);
