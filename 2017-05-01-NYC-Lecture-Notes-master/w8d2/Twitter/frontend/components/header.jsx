import React from 'react';
import { connect }  from 'react-redux';
import { Link }  from 'react-router-dom';
import { logout } from '../actions/session_actions';

const Header = function({currentUser, logout}) {
  function tweetEnticement() {
    return `Make a Tweet${currentUser ? `, ${currentUser.username}` : '' }!`;
  }

  const thingsToShow = () => {
    if (currentUser) {
      return (
        <section className="right-nav">
          <button onClick={logout}>
            BYE BYE
          </button>
        </section>
      );
    } else {
      return (
        <section className="right-nav">
          <Link to="/login">Log In</Link>
          <Link to="/signup">Sign Up</Link>
        </section>
      );
    }
  };

  return (
    <header className="my-header">
      <Link to="/maketweet">{tweetEnticement()}</Link>
      <Link to="/"><img className='logo' src={ window.images.tweeter } /></Link>
      {thingsToShow()}
    </header>
  );
};

const mapStateToProps = state => {
  return {currentUser: state.session.currentUser};
};

const mapDispatchToProps = dispatch => {
  return {
    logout: () => dispatch(logout())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Header);
