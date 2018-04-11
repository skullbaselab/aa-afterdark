import React from 'react';
import { Link } from 'react-router-dom';


const PostIndexItem = ({ post, deletePost }) => {
  return (
    <li>
      <Link to={`/posts/${post.id}`}>
        {post.title}
      </Link>&nbsp;
      <Link to={`/posts/${post.id}/edit`}>
        Edit
      </Link>
      <button onClick={() => deletePost(post.id)}>Delete</button>
    </li>);
};

export default PostIndexItem;
