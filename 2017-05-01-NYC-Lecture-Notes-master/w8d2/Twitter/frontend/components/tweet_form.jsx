import React from 'react';
import {connect} from 'react-redux';
import { createTweet } from '../actions/tweet_actions';

class TweetForm extends React.Component {
  constructor(props) {
    super(props);
    this.state =  {
      body: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return e => {
      this.setState({[field]: e.currentTarget.value});
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const tweet = this.state;
    this.props.createTweet({tweet}).then(action => this.props.history.push("/"));
  }

  render() {
    return (
      <section className="form-wrapper">
        <form onSubmit={this.handleSubmit}>
          <label>
            Body:
            <input onChange={this.update("body")}/>

          </label>
          <button>Submit tweet</button>
        </form>
      </section>
    );
  }
}

const mapDispatchToProps = function(dispatch) {
    return { createTweet: tweet => dispatch(createTweet(tweet)) };
};

export default connect(null, mapDispatchToProps)(TweetForm);
