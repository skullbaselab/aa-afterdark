import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

const Friends = ({ friends }) => (
  <ul className='friends'>
    { friends.map(friend => (
      <li key={friend.id}><Link to={`/cats/${friend.id}`}>{friend.name}</Link></li>
    ))}
  </ul>
);

const mapStateToProps = ({ cats }) => {
  return {
    friends: [cats[1], cats[2], cats[3]],
  };
};

export default connect(mapStateToProps)(Friends);
