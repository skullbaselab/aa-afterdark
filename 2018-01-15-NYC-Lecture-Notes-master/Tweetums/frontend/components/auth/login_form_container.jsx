import { connect } from 'react-redux'
import React from 'react'
import { Link } from 'react-router-dom'
import { loginUser } from '../../actions/user_actions'
import SessionForm from './session_form'

const mapStateToProps = state => {
  return {
    formType: 'login',
    navLink: <Link to="/signup">sign up instead</Link>
  }
}

const mapDispatchToProps = dispatch => {
  return {
    processForm: user => dispatch(loginUser(user))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm)
