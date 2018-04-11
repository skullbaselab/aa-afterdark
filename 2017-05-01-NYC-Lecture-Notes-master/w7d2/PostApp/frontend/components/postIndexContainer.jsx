import React from 'react';
import { connect } from 'react-redux';
import { receivePost, fetchPosts, updatePost } from '../actions/postActions';
import PostIndex from './postIndex';
import { postsFromState } from '../reducers/selectors';

const mapStateToProps = (state) => {
  debugger
  return {
    postsArray: postsFromState(state),
    postsObj: state.posts,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    likePost: (post) => {
      debugger
      return dispatch(updatePost(post));
    },
    fetchPosts: () => {
      return dispatch(fetchPosts());
    }
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PostIndex);
