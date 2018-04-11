import React, { Component } from 'react';
import { connect } from 'react-redux';
import { withRouter } from 'react-router';
import { createTweet } from '../actions/tweet_actions';

class TweetForm extends Component {

  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.state = { content: '' };
  }

  handleChange(e) {
    this.setState({ content: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createTweet(this.state).then(() => {
      this.setState({ content: '' });
      //redirect to '/tweets'
      //router is provided to named routes and when exporting with withRouter
      this.props.router.push('/tweets');
    });
  }

  render() {
    return (
      <section>
        <h3>New Tweet</h3>
        <form onSubmit={ this.handleSubmit }>
          <input onChange={ this.handleChange } value={ this.state.content }/>
          <button>Post Tweet</button>
        </form>
      </section>
    );
  }

}

function mapDispatchToProps(dispatch) {
  return { createTweet: (tweet) => dispatch(createTweet(tweet)) };
}

export default withRouter(connect(
  null,
  mapDispatchToProps
)(TweetForm));
