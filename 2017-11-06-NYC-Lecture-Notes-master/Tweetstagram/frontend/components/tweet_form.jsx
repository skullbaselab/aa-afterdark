import React, { Component } from 'react';
import { connect } from 'react-redux';
import { createTweet } from '../actions/tweet_actions';

class TweetForm extends Component {
  constructor(props) {
    super(props);
    this.state = { body: '' };
    this.submit = this.submit.bind(this);
  }

  handleChange(field) {
    return e => {
      this.setState({ [field]: e.currentTarget.value });
    };
  }

  submit(e) {
    e.preventDefault();

    this.props.createTweet(Object.assign({}, this.state)).then(() => {
      this.props.history.push('/');
    });
    // TODO: push to index after success
  }

  render() {
    return (
      <form onSubmit={ this.submit }>
        <label>Tweet a Tweet!</label>
        <input
          onChange={ this.handleChange('body') }
          value={ this.state.body }
          />

        <button>Create Tweet!</button>
      </form>
    );
  }
}

const mapDispatchToProps = dispatch => {
  return {
    createTweet: tweet => dispatch(createTweet(tweet)),
  };
};

export default connect(null, mapDispatchToProps)(TweetForm);
