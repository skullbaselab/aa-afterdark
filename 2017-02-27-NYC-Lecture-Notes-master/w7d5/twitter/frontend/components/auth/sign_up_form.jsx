import React, { Component } from 'react';
import { Link } from 'react-router';
import { connect } from 'react-redux';
import { signUp, receiveErrors } from '../../actions/session_actions';
import ErrorList from '../shared/error_list';
import AuthForm from './auth_form';

class SignUpForm extends Component {
  render() {
    return(
      <AuthForm
        processForm={this.props.signUp}
        clearErrors={this.props.clearErrors}
        errors={this.props.errors}
        actionText="Sign up"
        altAction="Sign in"
        altPath="/session/new"
      />
      );
  }
}

function mapStateToProps({ session: { errors } }) {
  return { errors };
}

function mapDispatchToProps(dispatch) {
  return {
    signUp: (user) => dispatch(signUp(user)),
    clearErrors: () => dispatch(receiveErrors({}))
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(SignUpForm);
