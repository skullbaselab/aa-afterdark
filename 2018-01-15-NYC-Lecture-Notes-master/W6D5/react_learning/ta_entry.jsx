import React from 'react';

export default class TAEntry extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      points: 0
    };
    this.upVote = this.upVote.bind(this);
  }

  upVote(e) {
    // debugger
    // setState will automatically re-render
    this.setState({ points: this.state.points + 1 });
    this.props.cumulativeUpvote();
  }
  // Use 'className' as opposed to 'class' when defining a css class selector in a React
  // component or inner html element
  render() {
    return(
      <div>
        <li className='big' onClick={ this.upVote } >{ this.props.name }</li>
        <span> { this.state.points } </span>
      </div>
    );
  }
}
