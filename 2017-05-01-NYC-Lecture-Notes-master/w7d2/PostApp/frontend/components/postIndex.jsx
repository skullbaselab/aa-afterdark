import React from 'react';

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
      updatedPost.like_count += 1;
      debugger
      this.props.likePost(updatedPost);
    };
  }

  render() {
    debugger
    const posts = this.props.postsArray.map((post) => {
      return(
        <li className="post" key={post.id}>
          <span className="title">{post.title}</span>
          <span className="body">{post.body}</span>
          <span className="likes">likes: {post.like_count}</span>
          <button className="like-button" onClick={this.likePost(post.id)}>
            Like
          </button>
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
