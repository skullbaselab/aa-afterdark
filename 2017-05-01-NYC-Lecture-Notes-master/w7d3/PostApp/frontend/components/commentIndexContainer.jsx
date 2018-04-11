import React from 'react';
import { connect } from 'react-redux';
import CommentIndex from './commentIndex';
import { commentsFromState } from '../reducers/selectors';

const mapStateToProps = (state, ownProps) => {
  // state is the whole state (i.e. store.getState())
  // ownProps! connect will pass this as a second argument
  // these are the props that have been passed directly to this component
  return {
    comments: commentsFromState(state, ownProps.commentIds)
  };
  // CommentIndex will have a prop of comments as an array
};

const mapDispatchToProps = (dispatch) => {
  return {};
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(CommentIndex);
