import React, { Component } from 'react';
import { connect } from 'react-redux';
import { withRouter, Link } from 'react-router'
import { signOut } from '../../actions/session_actions'

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

    const { currentUser } = this.props;
    if (currentUser) {
      return (
        <section>
          <span>Logged in as { currentUser.username }</span>
          <button onClick={ this.handleSignOut } className="log-out">
            Sign Out
          </button>
        </section>
      )
    } else {
      return (
        <Link to="/session/new">Log In!</Link>
      )
    }
  }

}

function mapDispatchToProps(dispatch) {
  return { signOut: () => dispatch(signOut()) };
}

function mapStateToProps({ session: { currentUser } }) {
  return {
    currentUser
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(withRouter(LogOutButton));
