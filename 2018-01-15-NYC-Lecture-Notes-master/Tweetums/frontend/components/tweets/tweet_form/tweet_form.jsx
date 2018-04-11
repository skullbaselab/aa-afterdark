import React from "react";

class TweetForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { body: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }

  updateBody(e) {
    this.setState({body: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createTweet(this.state).then(() => {
      this.props.history.push('/');
    });
    this.setState({body: ""});
    // TODO: push to index after success
  }

  render() {
    const { body } = this.state;
    return (
      <form onSubmit={this.handleSubmit}>
        <input type="text" value={ body } onChange={this.updateBody} />
        <input type="submit" value="TWEET'EM a TWEETUM" />
      </form>
    );
  }
}

export default TweetForm;
