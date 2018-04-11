import React from 'react';
import CommentIndexContainer from './commentIndexContainer';

class PostIndex extends React.Component {
  constructor(props) {
    super(props);
    this.likePost = this.likePost.bind(this);
  }

  componentDidMount() {
    this.props.fetchPosts().then( (action) => console.log(action));
  }

  likePost(id) {
    return (e) => {
      const updatedPost = this.props.postsObj[id];
      updatedPost.like_count += 1; // are we modifying props?!?!
      // what happens if the AJAX call fails?
      // our frontend would be out of sync with our database

      // better way (if we're sure the AJAX call will succeed):
      // const updatedPost = Object.assign({}, this.props.postsObj([id]));
      // updatedPost.like_count += 1;

      // even better (or at least safer) way:
      // let the backend take care of updating the like_count
      // we'd have to create a different API call to handle this
      // for good UI, we'd have to let the user know that we're doing some work (like a spinner)
      debugger
      this.props.likePost(updatedPost);
    };
  }

  render() {
    const posts = this.props.postsArray.map((post) => {
      return(
        <li className="post" key={post.id}>
          <span className="title">{post.title}</span>
          <span className="body">{post.body}</span>
          <span className="likes">likes: {post.like_count}</span>
          <button className="like-button" onClick={this.likePost(post.id)}>
            Like
          </button>
          <CommentIndexContainer commentIds={ post.comments } />
        </li>
      );
    });
    return (
      <ul>
        {posts}
      </ul>
    );
  }
}

export default PostIndex;
