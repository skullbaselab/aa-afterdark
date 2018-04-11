import React from 'react';
import { connect } from 'react-redux';

import Spinner from './Spinner';
import { fetchTweet } from '../actions/tweet_actions';

const mapStateToProps = ({ fetching, tweet}, ownProps) => ({ fetching, tweet });

const mapDispatchToProps = (dispatch) => ({
  fetchTweet: (id) => dispatch(fetchTweet(id))
});

class Tweet extends React.Component {

  componentDidMount() {
    const { id } = this.props.match.params;
    this.props.fetchTweet(id);
  }

  componentWillReceiveProps(newProps) {
    const newId = newProps.match.params.id;
    const oldId = this.props.tweet.id;
    if (parseInt(newId) !== oldId) {
      this.props.fetchTweet(newId);
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
