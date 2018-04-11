import React from 'react';
import { NavLink } from 'react-router-dom';

class Navbar extends React.Component {

  render() {
    let welcomeMessage;
    if (this.props.currentUser) {
      welcomeMessage = <span>Welcome, {this.props.currentUser.username}</span>;
    }
    return (
      <nav>
        {welcomeMessage}
        <NavLink to='/tweets/new'>Write a Tweet</NavLink>
        <NavLink exact to='/'>Feed</NavLink>
        {/* '/' -> tweetindex, 'tweets/new -> form', 'users/5 -> user 5 profile' */}
      </nav>
    );
  }
}

export default Navbar;
