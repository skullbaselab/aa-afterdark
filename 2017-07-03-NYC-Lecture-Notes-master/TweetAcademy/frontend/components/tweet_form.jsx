import React from 'react';
import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import { createTweet } from '../actions/tweet_actions';

class TweetForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      body: '',
    };

    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    this.setState({body: e.currentTarget.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createTweet(this.state)
      .then((res) => this.props.history.push(`/users/${res.tweet.author_id}`));
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input type="text" value={this.state.body} onChange={this.handleInput} />
        <button>Submit Tweet!</button>
      </form>
    );
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    createTweet: tweet => dispatch(createTweet(tweet)),
  };
};

export default withRouter(connect(null, mapDispatchToProps)(TweetForm));













// bottom
