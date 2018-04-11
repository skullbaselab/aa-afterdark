import React from 'react';

class PostIndex extends React.Component {
  constructor(props) {
    super(props);
    this.likePost = this.likePost.bind(this);
  }

  componentDidMount() {
    debugger
    this.props.fetchPosts()
      .then((thingy) => console.log(thingy));
  }

  likePost(id) {
    // This is not how you would implement likes. Simplified for demo purposes
    return (e) => {
      debugger
      const updatedPost = Object.assign({}, this.props.postsObj[id]);
      updatedPost.like_count += 1;
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
