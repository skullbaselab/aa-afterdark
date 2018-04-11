import React from 'react'
import { connect } from 'react-redux'

import { logoutUser } from '../actions/user_actions'
import { currentUser } from '../reducers/selectors'

const Header = ({ currentUser, logout }) => {
  const logoutBtn = <button onClick={logout}>Logout!</button>
  return (
    <header>
      <h1>TWEETUMS</h1>
      <h3>Legally different than Twitter!</h3>
      {currentUser && <p>Extremely online as {currentUser.username}</p>}
      {currentUser && logoutBtn}
    </header>
  )
}

const mapStateToProps = state => ({
  currentUser: currentUser(state)
})

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logoutUser())
})

export default connect(mapStateToProps, mapDispatchToProps)(Header)
