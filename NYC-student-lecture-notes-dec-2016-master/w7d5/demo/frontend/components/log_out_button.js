import React, { Component } from 'react';
import { connect } from 'react-redux';
import { withRouter } from 'react-router'
import { signOut } from '../actions/session_actions'

class LogOutButton extends Component {

  constructor(props) {
    super(props);
    this.handleSignOut = this.handleSignOut.bind(this);
  }

  handleSignOut(e) {
    this.props.signOut().then(() =>
      this.props.router.push('/session/new')
    )
  }

  render() {
    return (
      <button onClick={ this.handleSignOut } className="log-out">
        Sign Out
      </button>
    )
  }

}

function mapDispatchToProps(dispatch) {
  return { signOut: () => dispatch(signOut()) };
}

export default connect(null, mapDispatchToProps)(withRouter(LogOutButton));
