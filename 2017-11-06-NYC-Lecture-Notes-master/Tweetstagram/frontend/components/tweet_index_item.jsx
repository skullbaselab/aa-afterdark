import React from 'react';
import CommentIndex from './comment_index';
import { Link } from 'react-router-dom';

export default class TweetIndexItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      showComments: false
    };
    this.toggleComments = this.toggleComments.bind(this);
  }

  comments() {
    if (this.state.showComments) {
      return <CommentIndex tweet={this.props.tweet}/>;
    }
    return null;
  }

  toggleComments() {
    this.setState({showComments: !this.state.showComments});
  }
  render() {
    return (
      <li className="tweet" onClick={this.toggleComments}>
        {/* TODO: make link to user show */}
        {this.props.tweet.body} by
        <Link to={`/users/${this.props.tweet.author_id}`}>
          {this.props.tweet.authorName}
        </Link>
        {this.comments()}
      </li>
    );
  }
}
