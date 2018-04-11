import React from 'react';
import { withRouter } from 'react-router';
import Blue from './blue';

class Red extends React.Component {
  constructor() {
    super();
    this.resetRed = this.resetRed.bind(this);
    this.addOrange = this.addOrange.bind(this);
    this.addYellow = this.addYellow.bind(this);
  }

  render() {
    debugger;
    return(
      <div>
        <h2 className="red"></h2>
        <h4 onClick={this.resetRed}>Red only</h4>
        <h4 onClick={this.addOrange}>Add orange</h4>
        <h4 onClick={this.addYellow}>Add yellow</h4>
        {console.log(this.context)}
        <Blue/>
        {this.props.children}
      </div>
    );
  }

  resetRed() {
    // your code here
  }

  addOrange() {
    // your code here
  }

  addYellow() {
    this.props.router.push('/red/yellow/React');
  }
};

export default withRouter(Red);
// export default Red;
