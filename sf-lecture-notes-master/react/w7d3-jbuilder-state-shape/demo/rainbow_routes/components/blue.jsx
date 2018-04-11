import React from 'react';
import { withRouter } from 'react-router';

class Blue extends React.Component {
  constructor() {
    super();
    this.resetBlue = this.resetBlue.bind(this);
    this.addIndigo = this.addIndigo.bind(this);
  }

  render() {
    return(
      <div>
        <h2 className="blue"></h2>
        <h4 onClick={this.resetBlue}>Blue only</h4>
        <h4 onClick={this.addIndigo}>Add indigo</h4>
        <h4>{/*this.props.params.splat*/}</h4>
        {console.log(this.context)}
        {this.props.children}
      </div>
    );
  }

  resetBlue() {
    // your code here
  }

  addIndigo() {
    this.context.router.push('/blue./indigo');
  }
};

Blue.contextTypes = {
  router: React.PropTypes.object
};


export default withRouter(Blue);
// export default Blue;
