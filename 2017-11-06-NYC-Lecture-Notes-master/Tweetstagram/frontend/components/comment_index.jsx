import React from 'react';
import { connect } from 'react-redux';
import { fetchComments, deleteComment } from '../actions/comment_actions';

class CommentIndex extends React.Component {

  componentDidMount() {
    this.props.fetchComments(this.props.tweet.id);
  }

  render ()  {
    const comments = this.props.comments.map((comment) => {
      return (
        <li key={comment.id}>
          {comment.body}
          <button onClick={() => this.props.deleteComment(comment.id)}>Delete</button>
        </li>
      );
    });
    return (
      <div>
        <h1>Comments</h1>
        <ul>
          {comments}
        </ul>
      </div>
    );
  }
}


const mapStateToProps = (state, ownProps) => {
  const comments = [];
  ownProps.tweet.commentIds.forEach((commentId) => {
    if (state.comments[commentId]) {
      comments.push(state.comments[commentId]);
    }
  });
  return {
    comments
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    fetchComments: (tweetId) => dispatch(fetchComments(tweetId)),
    deleteComment: (commentId) => dispatch(deleteComment(commentId)),
  };
};
export default connect(mapStateToProps, mapDispatchToProps)(CommentIndex);
