import React from 'react';
import { Link, NavLink } from 'react-router-dom';

const Header = () => (
  <header>
    <Link to='/'><h1>Catsss!</h1></Link>
    <NavLink exact to='/cats' activeClassName='visiting'>Browse</NavLink>
    <NavLink to='/cats/1' activeClassName='visiting'>Best Cat</NavLink>
  </header>
);

export default Header;
