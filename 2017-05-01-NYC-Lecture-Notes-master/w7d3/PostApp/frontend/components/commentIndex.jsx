import React from 'react';

class CommentIndex extends React.Component { // this should be a functional component :)
  constructor(props) {
    super(props);
    debugger;
  }

  render() {
    if (!this.props.comments) return <span>Loading...</span>;
    // this.props.comments comes from the container
    const comments = this.props.comments.map((comment) => {
      return(
        <li className="comment" key={ comment.id }>
          { comment.body }
        </li>
      );
    });

    return <ul>{ comments }</ul>;
  }
}

export default CommentIndex;
