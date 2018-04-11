import React, { Component } from 'react';
import { connect } from 'react-redux';
import { createTweet } from '../actions/tweet_actions';
import { Link, withRouter } from 'react-router';


class TweetForm extends Component {

  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.state = { content: "" };
  }

  handleChange(e) {
    this.setState({ content: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const { router } = this.props;
    this.props.createTweet(this.state).then(() => router.push("/"));
  }

  render() {
    return (
      <section>
        <Link to="/" activeClassName="woot">Check out the tweets</Link>
        <h3>Hey {this.props.currentUser.username}, Tweet a Tweet!</h3>
        <form onSubmit={ this.handleSubmit }>
          <input onChange={ this.handleChange } value={ this.state.content }/>
          <button>Post Tweet</button>
        </form>
      </section>
    );
  }
}

function mapStateToProps(state) {
  // TODO
  // let's add the current user as a prop, then display the username somewhere
  return {
    currentUser: state.session.currentUser
  };
}

function mapDispatchToProps(dispatch) {
  return { createTweet: (tweet) => dispatch(createTweet(tweet)) };
}

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(TweetForm));
