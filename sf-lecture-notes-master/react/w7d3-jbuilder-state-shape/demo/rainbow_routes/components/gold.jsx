import React from 'react';
import Red from './red';
import {withRouter} from 'react-router';

class Gold extends React.Component {
	getChildContext() {
    return {router: this.props.router};
  }

	render() {
	  return (
		  <div>
		    <h2 className="gold">{console.log(this.context)}</h2>
		    <Red/>
		  </div>
		  );
	}
}

Gold.childContextTypes = {
  router: React.PropTypes.object
};

export default withRouter(Gold);
